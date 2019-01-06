How to compile Envoy

- Install bazel

- Install the following dependencies: `sudo apt-get install libtool cmake automake ninja-build curl unzip coreutils`

*Note `coreutils` is a replacement for `realpath` on Ubuntu 18*

- add repositories for bionic at https://apt.llvm.org/ to /etc/apt/sources.list.d/llvm.list
- Install: `sudo apt-get install clang-format-7`

- Install golang
- Install buildifier: `go get github.com/bazelbuild/buildtools/buildifier`
- Compile Envoy: `bazel build //source/exe:envoy-static`
