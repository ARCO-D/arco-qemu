# clean initrd
rm -rf initrd
mkdir initrd
# copy toolchains-sysroot
tar -xvf repo/sysroot.tar.gz -C initrd
#cp -r /home/arco/x-tools/aarch64-kirin7-linux-gnu/aarch64-kirin7-linux-gnu/sysroot/* initrd/
# copy executable to bin
cp -r repo/bin/ initrd/
# create symlink of busybox
cp repo/createbin.sh initrd
cd initrd
sh createbin.sh
cd ..
# copy init file
cp repo/init initrd/
ln -s /bin/busybox initrd/linuxrc
echo "find .|cpio -H newc -o|gzip -c > ../initrd.cpio.gz" > initrd/makecpiogz
chmod +x initrd/makecpiogz
cd initrd
sh makecpiogz
