#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 7.1 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-7 g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
gcc --version
echo "================== Successfully Installed gcc 7.1 ==============="

echo "==================== Installing clang 4.0.0 ==================="
wget -nv http://llvm.org/releases/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar xf clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
cd clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang 4.0.0 ============"
