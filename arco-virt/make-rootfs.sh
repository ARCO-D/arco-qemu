# clean rootfs
umount rootfs
rmdir rootfs
mkdir rootfs
# create empty image file
dd if=/dev/zero of=arco.img bs=1024k count=1024
mkfs.ext4 arco.img 
mount arco.img rootfs

# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C rootfs
# make essential dir

# copy executable to bin
cp -r repo/bin/* rootfs/bin
# copy init file
cp repo/rc.sysinit rootfs/etc/rc.d/
cp repo/inittab rootfs/etc/

# create symlink of busybox
cp repo/createlink.sh rootfs
cd rootfs
sh createlink.sh
cd ..

# install software
## tar
cp repo/install/* rootfs/data/
cd rootfs/data/
find . -maxdepth 1 -name "*.tar.gz" -exec tar -zxvf {} \;
rm *.tar.gz
## link
cd ../usr/bin/
ln -s /data/ssh/bin/* .
ln -s /data/ssh/sbin/* .
ln -s /data/gcc/bin/* .
ln -s /data/file-5.41/bin/* .
ln -s /data/binutils-min/bin/* .
cd ../../..


# end
umount rootfs
