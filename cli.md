# r1: flash and restore the Rabbit R1 from macOS and Linux

`r1` puts r1metal on a Rabbit R1, puts Rabbit OS back, and works with an R1 running r1metal over USB. It is one file with nothing else to install, for macOS (Apple silicon and Intel) and Linux (x86-64 and arm64). [Install](README.md#install) downloads it and sets it up.

```
./r1 [--device DEVICE] COMMAND [ARGUMENTS]
```

`./r1 --help` lists the commands, and `./r1 COMMAND --help` describes one.

| Command | Does |
|---|---|
| [`flash`](#flash) | Write r1metal to the R1 and boot it |
| [`restore`](#restore) | Put Rabbit's firmware back and boot Rabbit OS, erasing user data |
| [`key`](#key) | Give a running R1 an OpenAI key, checked with OpenAI first |
| [`devices`](#devices) | List the R1s plugged in: what each runs, its port and its serial number |
| [`sh`](#sh) | Run a console command on a running R1 |
| [`logs`](#logs) | Copy the logs a running R1 keeps to this computer, or follow its log |
| [`pull`](#pull-and-push) | Copy a file or directory of a running R1 to this computer |
| [`push`](#pull-and-push) | Copy a file of this computer to a running R1, in place of what is there |
| [`record`](#record) | Record a running R1's screen into an MP4 |
| [`bootloader`](#bootloader) | Print the bootloader's variables and its log, leaving the R1 in fastboot |
| [`build`](#build) | Build the boot image and the overlay from source |

## Options of every command

| Option | |
|---|---|
| `--device DEVICE` | The R1 a command is for where several are plugged in: its port or the end of its serial number, as `./r1 devices` lists them. On macOS bus numbers start at 0, as in `0-1`. Also read from `R1_DEVICE`. With several R1s plugged in, a command runs only once one is named. |
| `-h`, `--help` | Print help. |
| `-V`, `--version` | Print the version. |

A default path is relative to the r1metal source tree the current directory lies in, else to the current directory. A path given on the command line is used as given.

## flash

```
./r1 flash [IMAGE] [--overlay FILE] [--both] [--wipe] [--log off|on|debug]
```

Writes the boot image and the overlay to the slot the R1 does not boot from, and reboots into them.

| Argument or option | |
|---|---|
| `IMAGE` | The boot image. Default `out/boot.img`. |
| `--overlay FILE` | The device tree overlay. Default `out/dtbo.img`. |
| `--both` | Write both slots, the one the R1 boots from last. |
| `--wipe` | Erase user data first: everything r1metal keeps. |
| `--log off\|on\|debug` | How much the R1 logs from its first line until logging is set on the R1 (the debug screen's LOG line, or `./r1 sh log`). `debug` also logs debug lines. Default `on`. |

Before it writes anything, `flash` checks the boot image and the overlay, then asks for an OpenAI key. The key is not shown as it is typed, and `flash` checks it with OpenAI. Enter flashes without a key. An R1 that runs r1metal and already keeps a key is not asked. The R1 keeps the key unencrypted in `/data/.r1metal/openai/key`.

`flash` reaches the R1 powered off or running r1metal:

- **Powered off.** Run `flash`, then plug the R1 in. It is caught in its preloader and sent into fastboot.
- **Running r1metal.** It is told to restart into its bootloader.
- **Locked bootloader.** `flash` asks the bootloader whether it can unlock. If it cannot, `flash` stops with nothing written. If it can, `flash` unlocks it without asking, and the R1 shows a prompt that needs no answer. Rabbit allows the unlock per device ([Rabbit's guide](https://www.rabbit.tech/support/article/unlock-bootloader-rabbit-r1)).

A flash follows its R1 by port through the preloader and the bootloader and touches no other.

| Flash | User data |
|---|---|
| that had to unlock | erased |
| on an unlocked R1 | kept |
| with `--wipe` | erased |

## restore

```
./r1 restore [--stock DIR]
```

Puts Rabbit's firmware back and boots Rabbit OS.

`restore` writes Rabbit's images of a slot to both slots, the slot the R1 boots from last. Those images are:

- the bootloader
- the firmware the chips load
- `boot`, `dtbo` and the vbmeta images

Then it writes `super` and the logo, and boots Rabbit OS from slot a. The preloader is never written. User data is always erased. Before it erases anything, `restore` checks that each image is what it is named for. It reaches the R1 as `flash` does.

| Option | |
|---|---|
| `--stock DIR` | [Rabbit's v0.8.293 firmware](https://github.com/rabbit-hmi-oss/firmware/releases/tag/v0.8.293), unzipped: the directory `rabbit_OS_v0.8.293_20250516110545`. Also read from `R1_STOCK`. Default `stock/v0.8.293/rabbit_OS_v0.8.293_20250516110545`. |

## key

```
./r1 key [--qr]
```

Asks for an OpenAI key and checks it with OpenAI. The running R1 then keeps it, in place of any earlier key.

| Option | |
|---|---|
| `--qr` | Show the checked key as a QR code in the terminal instead. On the R1, choose **SCAN QR CODE** in the OPENAI KEY window and hold its camera to the code. |

## devices

```
./r1 devices
```

Lists the R1s plugged in: what each runs, its port and its serial number.

## sh

```
./r1 sh VERB [ARGUMENT...]
./r1 sh -
```

Runs a console command on a running R1 and prints its reply.

With `-`, `sh` runs one command per line of standard input over one connection. It prints `$ line` before each reply and `! error` for a refusal. It continues after a refused command and stops at the first link error.

Every r1metal accepts these verbs:

| Verb | Does |
|---|---|
| `ping`, `ping WORD` | Answers `pong`, or `WORD`. |
| `reboot`, `bootloader`, `poweroff` | Restarts, restarts into the bootloader, or powers off. |
| `input ptt down`, `input ptt up`, `input wheel N`, `input touch X Y`, `input lift` | Injects that input into whatever shows. |
| `input pose upright\|right-up\|upside-down\|left-up` | A viewfinder or a large video behaves as if the R1 were held that way. This lasts until the accelerometer reports otherwise. |
| `anim on`, `anim off` | The frame pacing test. `off` answers with its statistics. |
| `clock SECONDS MINUTES` | Sets the clocks to seconds since the epoch (UTC) and the UTC offset to minutes. `./r1 sh clock` sends this computer's. |
| `time` | Queries the time and place services. |
| `radio on`, `radio off` | Keeps the radio powered until `off` or the next sleep. |
| `scan [MHZ...]`, `scan ask [MHZ...]` | One passive Wi-Fi scan, or one the driver may make active, on those channels or all. |
| `channels` | Logs how the kernel's rules mark each channel. |
| `link on`, `link off` | Joins the default network and stays on it until `off`, a sleep, or the network is lost. |
| `resolve NAME` | A name's addresses. |
| `fetch URL` | A page's status, length, SHA-256 and timings. |
| `talk URL TEXT` | A WebSocket echo. |
| `news` | Builds the day's edition again. |
| `chat TEXT` | The conversation takes `TEXT` as if it were typed on its screen. The reply is spoken unless muted. |
| `record on`, `record off` | Starts a screen recording or stops it. |
| `key`, `key KEY` | Without a key, answers `kept` or `none`. With one, keeps it in place of any earlier key. |
| `log off`, `log on`, `log debug` | Sets the logging level and keeps it. |

The firmware on the release page also has the debug shell, which adds these verbs:

| Verb | Does |
|---|---|
| `ls PATH`, `cat PATH`, `dmesg` | A directory's entries, a file's text, or the kernel log. |
| `write PATH TEXT`, `rm PATH`, `mkdir PATH`, `rmdir PATH` | Writes a file, removes one file, creates a directory with its parents, or removes an empty directory. |
| `read PATH OFFSET LENGTH`, `append PATH BASE64` | Part of a file as one base64 line, or decoded base64 appended to a file. |
| `run PATH [ARGUMENT...]` | Makes the file executable and runs it. Answers its output, errors and exit status. |
| `sys NUMBER [ARGUMENT...]` | A system call with up to six arguments. Answers the return value and errno. |
| `peek ADDRESS LENGTH`, `poke ADDRESS HEX`, `rd32 ADDRESS COUNT`, `wr32 ADDRESS WORD...` | The app's memory in hex. `rd32` and `wr32` access mapped registers one 32-bit word at a time. |
| `later SECONDS PATH TEXT` | Writes a file after a delay, to undo a change that cuts the console off. |
| `burn THREADS SECONDS`, `hog BUSY_MS IDLE_MS TIMES` | Busy cores for thermal tests, or a competing thread on the drawing thread's core for pacing tests. |
| `decode PATH FRAMES` | Runs an MP4's samples through the hardware decoder. |
| `tone HERTZ MILLISECONDS UNDER`, `heard PATH`, `play PATH` | Plays a tone, describes an MP4's audio per second, or plays an MP4. All at the set volume. |

## logs

```
./r1 logs [DIR]
./r1 logs -f
```

Copies every log the R1 keeps into `DIR`. The default is `logs/device`.

| Option | |
|---|---|
| `-f`, `--follow` | Print the R1's log as it is written instead, until the R1 disconnects. |

Logs contain network names, addresses and device identifiers.

## pull and push

```
./r1 pull REMOTE LOCAL
./r1 push LOCAL REMOTE
```

`pull` copies a file or directory of the R1 to this computer. `push` copies one file to the R1, in place of what is there.

```sh
./r1 pull /data/camera/pictures pictures
./r1 push clip.mp4 /data/camera/videos/clip.mp4
```

## record

```
./r1 record FILE.mp4
```

Records the screen into an H.264 MP4 at 60 frames a second until Ctrl-C. It needs `ffmpeg` with `libx264` on this computer. The first Ctrl-C waits for the last frames, and a second one exits at once. Tried from Linux only.

## bootloader

```
./r1 bootloader
```

Prints the bootloader's variables and its log. The R1 stays in fastboot.

## build

```
./r1 build [--stock DIR] [--out FILE] [--overlay FILE] [--enable-extras]
```

Builds the kernel and the firmware from r1metal's source, which follows. `build` runs only on Linux on x86-64. The first build fetches the kernel's source, Rabbit's modules, LLVM and musl, about 17 GB.

| Option | |
|---|---|
| `--stock DIR` | Rabbit's unpacked firmware, whose driver files the firmware is packed with. Also read from `R1_STOCK`. Default `stock/v0.8.293/rabbit_OS_v0.8.293_20250516110545`. |
| `--out FILE` | The boot image written. Default `out/boot.img`. |
| `--overlay FILE` | The overlay written. Default `out/dtbo.img`. |
| `--enable-extras` | Build the firmware with its extras, which the menus show only then: the Pokédex. |

## macOS and Linux

- **macOS** asks "Allow accessory to connect?" each time the R1 appears on USB, which is after every reboot. `r1` says so before it waits, and continues once the R1 is allowed. The preloader listens for only about 2.5 s, so catching an R1 at power-on needs macOS to stop asking. Set System Settings › Privacy & Security › Security › Allow accessories to connect › **Automatically When Unlocked**.
- **Linux** lets `r1` reach the R1 without root once [`udev/70-r1metal.rules`](udev/70-r1metal.rules) is installed ([Install](README.md#install)).
