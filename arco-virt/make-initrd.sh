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
cp repo/script/init initrd/
# create symlink of busybox
cp repo/script/createlink.sh initrd
cd initrd
sh createlink.sh
cd ..

# make cpio.gz
echo "find .|cpio -H newc -o|gzip -c > ../initrd.cpio.gz" > initrd/makecpiogz
chmod +x initrd/makecpiogz
cd initrd
sh makecpiogz
cd ..

