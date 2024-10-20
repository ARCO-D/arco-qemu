# clean initrd
rm -rf initrd
mkdir initrd
# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C initrd
# make essential dir
mkdir initrd/proc
mkdir initrd/dev
mkdir initrd/sys
mkdir initrd/etc/init.d/

# copy executable to bin
cp -r repo/bin/ initrd/bin
# copy init file
cp repo/rcS initrd/etc/init.d/ # specify in busybox src, macro INIT_SCRIPT
ln -s /bin/busybox initrd/init
# create symlink of busybox
cp repo/createbin.sh initrd
cd initrd
sh createbin.sh
cd ..

# make cpio.gz
echo "find .|cpio -H newc -o|gzip -c > ../initrd.cpio.gz" > initrd/makecpiogz
chmod +x initrd/makecpiogz
cd initrd
sh makecpiogz
cd ..

