### Install bazel
apt-get update
apt-get install pkg-config zip g++ zlib1g-dev unzip python
curl https://github.com/bazelbuild/bazel/releases/download/0.21.0/bazel-0.21.0-installer-linux-x86_64.sh > bazel-installer.sh
chmod +x bazel-install.sh
./bazel-installer.sh --user
export PATH=$PATH:$HOME/bin

### Install Envoy dependencies
apt-get install libtool cmake automake ninja-build curl unzip coreutils

cat '' >> /etc/apt/sources.list
cat 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main' >> /etc/apt/sources.list
cat 'deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic main' >> /etc/apt/sources.list
cat 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main' >> /etc/apt/sources.list
cat 'deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main' >> /etc/apt/sources.list
cat 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main' >> /etc/apt/sources.list
cat 'deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main' >> /etc/apt/sources.list

apt-get install clang-format-7

curl https://golang.org/doc/install?download=go1.11.4.linux-amd64.tar.gz > go.tar.gz
tar -C /usr/local -xzf go.tar.gz

go get github.com/bazelbuild/buildtools/buildifier

### Build Envoy
git clone https://github.com/envoyproxy/envoy.git
cd envoy
bazel build //source/exe:envoy-static
mv envoy/source/exe/envoy-static envoy
