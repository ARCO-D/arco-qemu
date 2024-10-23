rm -rf initrd
rm -f initrd.cpio.gz
echo "rm initrd initrd.cpio.gz"
gzip vmlinux
echo "gzip vmlinux"
rm virt.dtb virt.dts arco.dtb
echo "rm virt.dtb virt.dts arco.dtb"
