# clean rootfs
umount rootfs
rmdir rootfs
mkdir rootfs
# create empty image file
dd if=/dev/zero of=arco.img bs=1024k count=2048
echo "n
p
1

+100M
n
p
2

+1800M
t
1
ef
w
"| fdisk arco.img
lof=`losetup -f`
# p1 is for uefi, p2 is for rootfs
echo "free loop device:$lof"
losetup -P $lof arco.img
mkfs.vfat -F32 "${lof}p1"
mkfs.ext4 "${lof}p2"
mount "${lof}p2" rootfs

# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C rootfs

# copy Image and initrd
cp Image-* initrd.cpio.gz rootfs/boot

# copy executable to bin
cp -r repo/bin/* rootfs/bin
# copy init file
cp repo/script/rc.sysinit rootfs/etc/rc.d/
cp repo/script/inittab rootfs/etc/

# create symlink of busybox
cp repo/script/createlink.sh rootfs
cd rootfs
sh createlink.sh
cd ..

# install software
## tar
cp repo/install/* rootfs/data/
cd rootfs/data/
find . -maxdepth 1 -name "*.tar.gz" -exec tar -zxvf {} \;
rm *.tar.gz
find . -maxdepth 1 -name "*.tar.xz" -exec tar -xvf {} \;
rm *.tar.xz
## link
cd ../usr/bin/
ln -s ../../data/ssh/bin/* .
ln -s ../../data/ssh/sbin/* .
# ln -s ../../data/gcc/bin/* .
# ln -s ../../data/file-5.41/bin/* .
ln -s ../../data/binutils-min/bin/* .
# ln -s ../../data/python/bin/* .
# ln -s python3 python
ln -s ../../data/grub/bin/* .
ln -s ../../data/grub/sbin/* .
cd ../../..

pwd
# end

losetup -d $lof
umount rootfs
