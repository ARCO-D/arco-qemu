rm -rf build/*
echo "clean build"
echo "../configure --target-list=aarch64-softmmu;make -j16" > build/build.sh
cd arco-virt
sh clean.sh
echo "clean arco-virt"
