#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 4.8 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-4=4.8.0-1ubuntu1~14.04 \
  g++-4=4.8.0-1ubuntu1~14.04
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-3 50 --slave /usr/bin/g++ g++ /usr/bin/g++-4
gcc --version
echo "================== Successfully Installed gcc 4.8 ==============="

CLANG_VERSION=3.8.0
echo "==================== Installing clang $CLANG_VERSION ==================="
wget -nv http://llvm.org/releases/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04.tar.xz
cd clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"

# echo "======================= Installing gcc 7.2 ======================"
# add-apt-repository ppa:ubuntu-toolchain-r/test
# apt-get update
# apt-get install -y \
#   gcc-7=7.2.0-1ubuntu1~14.04 \
#   g++-7=7.2.0-1ubuntu1~14.04
# update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
# gcc --version
# echo "================== Successfully Installed gcc 7.2 ==============="
#
# CLANG_VERSION=4.0.0
# echo "==================== Installing clang $CLANG_VERSION ==================="
# wget -nv http://llvm.org/releases/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04.tar.xz
# tar xf clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04.tar.xz
# cd clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04
# cp -R * /usr/local/
# cd ../
# clang --version
# echo "=============== Successfully Installed clang $CLANG_VERSION ============"
