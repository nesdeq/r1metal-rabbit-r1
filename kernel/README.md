# Kernel

r1metal's kernel is Rabbit's published Linux 4.19 for the R1 with Rabbit's MediaTek Wi-Fi and Bluetooth drivers built in, carrying the patches here. They are licensed GPL-2.0, as the kernel they patch.

| Tree | Source | Commit | Patches |
|---|---|---|---|
| Kernel, at `src` | [android_kernel_rabbit_mt6765](https://github.com/rabbit-hmi-oss/android_kernel_rabbit_mt6765) | `8167c8c1087f057d2ef302fc93b47554291687ec` | [`patches/`](patches), 201 |
| Drivers, at `vendor/mediatek/kernel_modules` | [android_kernel_modules_rabbit_mt6765](https://github.com/rabbit-hmi-oss/android_kernel_modules_rabbit_mt6765) | `0afdf059a0dfa17becc4bbe47363280a42224c2f` | [`module-patches/`](module-patches), 56 |

[`config`](config) is the configuration of Rabbit's own kernel (rabbitOS v0.8.293). [`config.changes`](config.changes) holds where r1metal departs from it: each symbol it names takes its line from there ([`merge-config.awk`](merge-config.awk)). The compiler lines `config` carries are those of Rabbit's build (Android clang 11); `make olddefconfig` sets them from the compiler on the path, LLVM 23.1.3, which builds r1metal's kernel.

## Build

With [LLVM 23.1.3](https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.3) first on the path, from this directory:

```sh
git clone https://github.com/rabbit-hmi-oss/android_kernel_rabbit_mt6765 src
git -C src checkout 8167c8c1087f057d2ef302fc93b47554291687ec
git -C src am "$PWD"/patches/*.patch

git clone https://github.com/rabbit-hmi-oss/android_kernel_modules_rabbit_mt6765 vendor/mediatek/kernel_modules
git -C vendor/mediatek/kernel_modules checkout 0afdf059a0dfa17becc4bbe47363280a42224c2f
git -C vendor/mediatek/kernel_modules am "$PWD"/module-patches/*.patch

mkdir -p out
awk -f merge-config.awk config.changes config > out/.config

kmake() {
  make -C src O="$PWD"/out -j"$(nproc)" \
    ARCH=arm64 CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy \
    OBJDUMP=llvm-objdump STRIP=llvm-strip READELF=llvm-readelf \
    CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-gnu- LLVM_IAS=1 \
    KCFLAGS=-mcpu=cortex-a53 KBUILD_BUILD_USER=r1metal KBUILD_BUILD_HOST=r1metal LOCALVERSION= "$@"
}
kmake olddefconfig
kmake Image.gz
```

The kernel lands in `out/arch/arm64/boot/Image.gz`.
