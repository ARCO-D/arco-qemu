# clean initrd
rm -rf initrd
mkdir initrd
# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C initrd
rm -rf initrd/usr
rm -rf initrd/data/*
# make essential dir

# copy executable to bin
cp -r repo/bin/* initrd/bin
# copy driver file
# (consider the of compatible of kernel, do not copy driver file

# copy init file
cp repo/bin/busybox initrd/init
# create symlink of busybox
cp repo/script/createlink.sh initrd
# copy ko
cp repo/ko/* initrd
# create busybox link
cd initrd
sh createlink.sh
cd ..

# make cpio.gz
echo "find .|cpio -H newc -o|gzip -c > ../initrd.cpio.gz" > initrd/makecpiogz
chmod +x initrd/makecpiogz
cd initrd
sh makecpiogz
cd ..

