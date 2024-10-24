# clean rootfs
umount rootfs
rmdir rootfs
mkdir rootfs
# create empty image file
dd if=/dev/zero of=arco.img bs=1024k count=512
mkfs.ext4 arco.img 
mount arco.img rootfs

# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C rootfs
# make essential dir

# copy executable to bin
cp -r repo/bin/* rootfs/bin
# copy init file
cp repo/rcS rootfs/etc/init.d/
# create symlink of busybox
cp repo/createlink.sh rootfs
cd rootfs
sh createlink.sh
cd ..

