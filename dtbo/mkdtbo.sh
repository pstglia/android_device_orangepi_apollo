#!/bin/bash

# Function copied from orangepi source files
CURRDIR=$(pwd)
DEVICE_PATH=${CURRDIR}/device/orangepi/apollo
PRODUCT_OUT=${CURRDIR}/out/target/product/apollo

function mkdtbo()
{
        local dtb_search_path=(
                ${DEVICE_PATH}/dtbo/h618/dtbo)

        local dtc_search_path=(
                ${DEVICE_PATH}/dtbo/h618/dtbo
                ${DEVICE_PATH}/dtbo/h618/bin)

        local DTO_COMPILER=""
        local DTBO_DIR=""

        for d in ${dtb_search_path[@]}; do
                [ -d $d ] && DTBO_DIR=$d && break
        done

        for d in ${dtc_search_path[@]}; do
                [ -d $d ] && [ -f $d/dtco ] && DTO_COMPILER=$d/dtco && break
        done
        if [ -n "$DTBO_DIR" ] && [ -n "$DTO_COMPILER" ];  then
                echo "build dtbo ..."
                local DTC_FLAGS="-W no-unit_address_vs_reg"
                local DTS_DIR=${DTBO_DIR}
                local DTBO_OUT_DIR_TMP=${PRODUCT_OUT}/dtbo_tmp/
		rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
		mkdir -p ${DTBO_OUT_DIR_TMP}

                if [ ! -f $DTO_COMPILER ]; then
                        echo "mkdtbo: Can not find dtco compiler."
                        exit 1
                fi

                local out_file_name=0
                for dts_file in ${DTS_DIR}/*.dts; do
                        out_file_name=${dts_file%.*}
			out_file_name_tmp="$(basename ${out_file_name})"
                        $DTO_COMPILER ${DTC_FLAGS} -a 4 -@ -O dtb -o ${DTBO_OUT_DIR_TMP}/${out_file_name_tmp}.dtbo ${dts_file}
                        if [ $? -ne 0 ]; then
                                echo "mkdtbo:create dtbo file failed"
				rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
                                exit 1
                        fi
                done

                local MKDTIMG=${DEVICE_PATH}/dtbo/h618/dtbo/mkdtimg
                local DTBOIMG_CFG_FILE=${DTBO_DIR}/dtboimg.cfg
                local DTBOIMG_OUT_DIR=${PRODUCT_OUT}
                if [ -f ${MKDTIMG} ]; then
                        if [ -f ${DTBOIMG_CFG_FILE} ]; then
				cp ${DTBOIMG_CFG_FILE} ${DTBO_OUT_DIR_TMP}
				DTBOIMG_CFG_FILE_BASE=$(basename ${DTBOIMG_CFG_FILE})
                                echo "mkdtbo: make  dtboimg start."
				cd ${DTBO_OUT_DIR_TMP}
                                ${MKDTIMG} cfg_create ${DTBOIMG_OUT_DIR}/dtbo.img ${DTBO_OUT_DIR_TMP}/${DTBOIMG_CFG_FILE_BASE}
                                ${MKDTIMG} dump ${DTBOIMG_OUT_DIR}/dtbo.img
				rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
                        else
                                echo "mkdtbo: Can not find dtboimg.cfg\n"
				rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
                                exit 1
                        fi
                else
                        echo "mkdtbo: Can not find mkdtimg\n"
			rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
                        exit 1
                fi

        else
                echo "don't build dtbo ..."
		rm -rf ${DTBO_OUT_DIR_TMP} 2>/dev/null
        fi

	# prebuilt dtb... (TODO: build it lazy )...
	cp ${DEVICE_PATH}/dtbo/sunxi.dtb ${PRODUCT_OUT}/dtb.img
}

mkdtbo
exit $?
