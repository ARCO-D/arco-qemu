# 简介
基于qemu-8.1.5的aarch64 virt板卡适配

不包含构建产物

Image initrd等在arco-virt路径下

# 环境信息
构建环境 ubuntu22.04

运行环境 linux-6.6.57

# 运行
本仓库不包含构建产物, 请参照此博客搭建QEMU编译环境, 在build目录下编译后才能使用

https://blog.csdn.net/weixin_44919664/article/details/142903492

# 预装程序
除busybox外

安装了gcc、g++、ssh、make、binutils

# 终端
用户 root

密码 arco

默认IP 192.168.3.30 (这个得先适配qemu-ifup脚本的网口

## 生成initrd
由于文件太多不便提交, 因此库上的归档尽可能简单, 请执行以下脚本构建initrd(rootfs同理

执行make-initrd.sh

## 生成arco.img
执行make-rootfs.sh


# EXTRA
库上已经归档了一个内核镜像Image和一个压缩过的vmlinux.gz

arco-virt下还归档了我用于编译此内核的交叉编译工具链aarch64-kirin7-linux-gnu
