#!/bin/sh

. linux/share/functions
. /etc/lsb-release

case "${DISTRIB_CODENAME}" in
    "hardy")
        MKTEMP_OPTS="-t"
    ;;

    *)
        MKTEMP_OPTS="--tmpdir"
    ;;
esac

download_dir=${download_dir:-`mktemp -d ${MKTEMP_OPTS} sei-download-XXXXXX`}
unpack_dir=${unpack_dir:-`mktemp -d ${MKTEMP_OPTS} sei-unpack-XXXXXX`}
orig_dir=${unpack_dir}/usr/share/pte-pmmc/menu_sei
dest_dir=${1}

sei_download ${download_dir}
sei_unpack ${download_dir} ${unpack_dir}
sei_install_data ${orig_dir} ${dest_dir} && rm -rf ${download_dir} ${unpack_dir}
