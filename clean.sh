rm -rf build/*
echo "clean build"
echo "../configure -target-list=aarch64-softmmu;time make -j16" > build/build.sh
cd arco-virt
sh clean.sh
echo "clean arco-virt"
