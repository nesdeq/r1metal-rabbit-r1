# r1: flash and restore the Rabbit R1 from macOS and Linux

`r1` puts r1metal on a Rabbit R1, puts Rabbit OS back, and works with an R1 running r1metal over USB. It is one file with nothing else to install, for macOS (Apple silicon and Intel) and Linux (x86-64 and arm64). [Install](README.md#install) downloads it and sets it up.

```
./r1 [--device DEVICE] COMMAND [ARGUMENTS]
```

`./r1 --help` lists the commands, and `./r1 COMMAND --help` describes one.

| Command | Does |
|---|---|
| [`flash`](#flash) | Write r1metal to the R1 and boot it |
| [`stock`](#stock) | Put Rabbit's firmware back and boot Rabbit OS, erasing user data |
| [`backup`](#backup-and-restore) | Copy what a running R1 keeps into a file, encrypted under the passphrase of its safe |
| [`restore`](#backup-and-restore) | Put a backup's files on a running R1 in place of what it keeps |
| [`key`](#key) | Give a running R1 an OpenAI key, checked with OpenAI first |
| [`devices`](#devices) | List the R1s plugged in: what each runs, its port and its serial number |
| [`sh`](#sh) | Run a console command on a running R1 |
| [`logs`](#logs) | Copy the logs a running R1 keeps to this computer, or follow its log |
| [`pull`](#pull-and-push) | Copy a file or directory of a running R1 to this computer |
| [`push`](#pull-and-push) | Copy a file of this computer to a running R1, in place of what is there |
| [`record`](#record) | Record a running R1's screen into an MP4 |
| [`bootloader`](#bootloader) | Print the bootloader's variables and its log, leaving the R1 in fastboot |
| [`build`](#build) | Build the boot image and the overlay from source |
| [`visibility`](#visibility) | Report every item of the source that reaches further than what uses it |

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

Once it has checked the boot image and the overlay and brought the R1 into fastboot, and before it writes anything, `flash` asks for an OpenAI key. The key is not shown as it is typed, and `flash` checks it with OpenAI. Enter flashes without a key. An R1 that runs r1metal with its safe open and already keeps a key is not asked, unless the flash erases user data and with it the key: with `--wipe`, or where the bootloader has to be unlocked. An R1 whose safe is shut cannot tell whether it keeps a key, and is asked. The R1 keeps the key in `/data/.r1metal/openai/key`, in the safe its passphrase opens.

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

## stock

```
./r1 stock [DIR]
```

Puts Rabbit's firmware back and boots Rabbit OS.

`stock` writes Rabbit's images of a slot to both slots, the slot the R1 boots from last. Those images are:

- the bootloader
- the firmware the chips load
- `boot`, `dtbo` and the vbmeta images

Then it writes `super` and the logo, and boots Rabbit OS from slot a. The preloader is never written. User data is always erased. Before it erases anything, `stock` checks that each image is what it is named for. It reaches the R1 as `flash` does.

| Argument | |
|---|---|
| `DIR` | [Rabbit's v0.8.293 firmware](https://github.com/rabbit-hmi-oss/firmware/releases/tag/v0.8.293), unzipped: the directory `rabbit_OS_v0.8.293_20250516110545`. Also read from `R1_STOCK`. Default `stock/v0.8.293/rabbit_OS_v0.8.293_20250516110545`. |

## backup and restore

```
./r1 backup FILE
./r1 restore FILE
```

`backup` asks for the passphrase of the R1's safe, which the R1 checks, and copies what the running R1 keeps into `FILE`, in place of a file that is there:

- photos, videos, notes, translations, news
- the conversation and the robot's memory
- settings and known networks
- the OpenAI key and its ledger
- Signal's account and conversations

`FILE` is an [age](https://age-encryption.org/v1) file under that passphrase. What is the device's own stays out: the battery's gauge and usage, the modem's and the SIM's files, the logs and the stamp of its flash.

`restore` asks for the backup's passphrase and for that of the R1's safe, stages the backup's files on an R1 that runs r1metal with its safe open, and restarts it. Once its passphrase is typed, the R1 puts each directory the backup holds in the place of its own and keeps what is the device's own. The R1 needs room for the backup beside what it keeps.

A restored R1 is the Signal device the backup's R1 was. Only one of the two may run with that account from then on.

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
| `link on`, `link off`, `link cell` | Joins the default network, or with `cell` the modem's connection, and stays on it until `off`, a sleep, or the network is lost. `link on` is refused where no network is known and the modem is not ready, `link cell` where the modem is not ready. |
| `camera on`, `camera off` | Runs a video call's camera with no call, until `off` or the next sleep. |
| `news` | Builds the day's edition again. |
| `chat TEXT` | The conversation takes `TEXT` as if it were typed on its screen. The reply is spoken unless muted. |
| `record on`, `record off` | Starts a screen recording or stops it. |
| `key`, `key KEY` | Without a key, answers `kept` or `none`. With one, keeps it in place of any earlier key. |
| `log off`, `log on`, `log debug` | Sets the logging level and keeps it. |
| `pin PIN` | Hands the SIM its PIN, 4 to 8 digits, as SIM PIN on the R1 does. |
| `attach on`, `attach off` | Keeps the modem attached between uses of the network, through sleeps too, until `off`. |
| `at COMMAND` | Sends an AT command to the modem. The log tells its answer. |

The firmware on the release page also has the debug shell, which adds these verbs and is what `pull`, `push`, `logs`, `backup` and `restore` work through:

| Verb | Does |
|---|---|
| `ls PATH`, `cat PATH`, `dmesg` | A directory's entries, a file's text, or the kernel log. |
| `write PATH TEXT`, `rm PATH`, `mkdir PATH`, `rmdir PATH` | Writes a file, removes one file, creates a directory with its parents, or removes an empty directory. |
| `read PATH OFFSET LENGTH`, `append PATH BASE64` | Part of a file as one base64 line, at most 49152 bytes, or decoded base64 appended to a file. |
| `sum PATH` | The SHA-256 of a file's bytes. |
| `unlock PASSPHRASE`, `lock` | Opens the gate where the passphrase is the safe's, and shuts it. |
| `stage`, `commit` | Makes the directory a restore's files are staged in, and confirms the staged files. Only with the gate open. |
| `tunnel BASE64` | Hands over a WireGuard tunnel's config, the text `wg-quick` takes, in base64. Only with the gate open. |
| `bench` | Times the codecs, the camera's pictures and the vector kernels on the R1. |

Until `unlock` has taken the safe's passphrase, the shell reaches neither Signal's files, the tunnel's config, the safe's key files nor a restore's. Three wrong passphrases, and none is checked until the R1 starts anew. A cable pulled shuts the gate. The shell never reaches the memory of any process or a file held in memory alone, however the path is written.

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

Records the screen into an H.264 MP4 at 60 frames a second until Ctrl-C. It needs `ffmpeg` with `libx264` on this computer. The first Ctrl-C waits for the last frames, and a second one exits at once. Works from macOS and Linux.

## bootloader

```
./r1 bootloader
```

Prints the bootloader's variables and its log. The R1 stays in fastboot.

## build

```
./r1 build [--stock DIR] [--out FILE] [--overlay FILE] [--enable-extras]
```

Builds the kernel and the firmware from [r1metal's source](https://github.com/nesdeq/r1metal-rabbit-r1-source), and runs in a clone of it. `build` runs on Linux on x86-64 or arm64, and on macOS in a Lima VM. The first build fetches the kernel's source, Rabbit's modules, LLVM and musl, about 17 GB.

| Option | |
|---|---|
| `--stock DIR` | Rabbit's unpacked firmware, whose driver files the firmware is packed with. Also read from `R1_STOCK`. Default `stock/v0.8.293/rabbit_OS_v0.8.293_20250516110545`. |
| `--out FILE` | The boot image written. Default `out/boot.img`. |
| `--overlay FILE` | The overlay written. Default `out/dtbo.img`. |
| `--enable-extras` | Build the firmware with its extras, which the menus show only then: the Pokédex. |

## visibility

```
./r1 visibility
```

Reports every item of [r1metal's source](https://github.com/nesdeq/r1metal-rabbit-r1-source) that reaches further than what uses it, and every item only tests use. It runs in a clone of the source, on Linux, and on macOS in the Lima VM; it takes minutes.

## macOS and Linux

- **macOS** asks "Allow accessory to connect?" each time the R1 appears on USB, which is after every reboot. `r1` says so before it waits, and continues once the R1 is allowed. The preloader listens for only about 2.5 s, so catching an R1 at power-on needs macOS to stop asking. Set System Settings › Privacy & Security › Security › Allow accessories to connect › **Automatically When Unlocked**.
- **Linux** lets `r1` reach the R1 without root once [`udev/70-r1metal.rules`](udev/70-r1metal.rules) is installed ([Install](README.md#install)).
