rm -rf initrd
rm -f initrd.cpio.gz
echo "rm initrd cache"
rm -rf rootfs
echo "rm rootfs cache"
gzip vmlinux
echo "gzip vmlinux"
rm virt.dtb virt.dts arco.dtb
echo "rm virt.dtb virt.dts arco.dtb"
rm arco.img
echo "rm arco.img"
