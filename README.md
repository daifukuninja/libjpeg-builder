# README

## [libjpeg](https://github.com/thorfdbg/libjpeg)のビルド+実行環境

以下の手順の実行には、事前にGit、および Docker 、 Docker Compose のインストールが必要です。
これらのインストールは別途公式の手順等を参考にしてください。

### 環境の構築(1) Dockerコンテナの起動

以下のコマンドで このリポジトリを任意のディレクトリにクローンします。

```sh
git clone https://github.com/daifukuninja/libjpeg-builder.git
```

以下のコマンドで docker コンテナを起動します。

```sh
docker compose up -d
```

以下のコマンドを実行し、コンテナが起動していることを確認します。

```sh
docker compose ps
```

以下のように、`STATUS`の欄に`Up ・・・"と表示されていればOKです。

```sh
NAME                        IMAGE                     COMMAND             SERVICE             CREATED              STATUS              PORTS
libjpeg-libjpeg-builder-1   libjpeg-libjpeg-builder   "sleep infinity"    libjpeg-builder     About a minute ago   Up About a minute  
```

### 環境の構築(2) `libjpeg`のビルド

以下のコマンドでコンテナ内に入り、コマンドプロンプト(sh)を起動します。

```sh
docker compose exec libjpeg-builder /bin/sh
```

以下のコマンドで`libjpeg`のソースをクローンします。`libjpeg`ディレクトリが作成され、ソースコードがコピーされます。

```sh
git clone https://github.com/thorfdbg/libjpeg.git
```

以下のコマンドを順に実行し、`libjpeg`ディレクトリへの移動、`make`の実行を行います。

```sh
cd libjpeg/
```

```sh
make
```

以下、make中のログです。(途中省略しています)

```sh
checking for g++-4.9... no
checking for g++-4.7... no
checking for g++-4.4... no
checking for g++-4.3... no
checking for g++-4.2... no
checking for g++-4.1... no
checking for g++-4.0... no
checking for g++-3.4... no
checking for g++-3.3... no
checking for g++-3.2... no
checking for g++... g++
checking whether the C++ compiler works... yes
checking for C++ compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking for gcc-4.9... no
checking for gcc-4.7... no

(中略)

checking for working const_cast<> capability... yes
checking for working reinterpret_cast<> capability... yes
checking for uniqueness of static members thru various derivation paths... yes
checking whether __restrict__ pointers are available... yes
checking for the -mfpmath=387 compiler switch... yes
checking for the -fvisibility=internal compiler switch... yes
checking for the -fPIC compiler switch... yes
configure: creating ./config.status
config.status: creating automakefile
config.status: creating autoconfig.h
Using g++ -O3 -DDEBUG_LEVEL=0 -DCHECK_LEVEL=0 -funroll-loops -fstrict-aliasing -Wno-redundant-decls -ffast-math   -Wall -W -Wunused -Wpointer-arith -pedantic -Wcast-qual -Wwrite-strings -Wno-long-long -Wredundant-decls -Wnon-virtual-dtor -Woverloaded-virtual -Wsign-promo -fno-exceptions -Wno-char-subscripts -Wno-shift-negative-value -I ..  -DUSE_AUTOCONF -mfpmath=387   -Wimplicit-fallthrough=1   
Compiling std/stdlib.cpp
Compiling std/stdio.cpp
Compiling std/math.cpp
Compiling std/stdarg.cpp
Compiling std/setjmp.cpp
Compiling std/errno.cpp

(中略)

Compiling upsampling/downsamplerbase.cpp
Compiling upsampling/downsampler.cpp
Compiling upsampling/interdownsampler.cpp
ar: creating libupsampling.a
Compiling control/bitmapctrl.cpp
Compiling control/residualblockhelper.cpp
Compiling control/blockctrl.cpp
Compiling control/blockbuffer.cpp
Compiling control/residualbuffer.cpp
Compiling control/linebuffer.cpp
Compiling control/blockbitmaprequester.cpp
Compiling control/linebitmaprequester.cpp
Compiling control/lineadapter.cpp
Compiling control/blocklineadapter.cpp
Compiling control/linelineadapter.cpp
Compiling control/linemerger.cpp
Compiling control/hierarchicalbitmaprequester.cpp
Compiling control/bufferctrl.cpp
ar: creating libcontrol.a
Linking...
/app/libjpeg #
```

以下のコマンドで、ビルドされた`jpeg`コマンドを`libjpeg`の１つ上のディレクトリ(直下)にコピーします。

```sh
cp jpeg ..
```

現在は`/app/libjpeg`ディレクトリにいるはずですので、以下のコマンドで元のディレクトリ(`jpeg`のコピー先)へ移動します。

```sh
cd ..
```

## ppmファイルの変換

変換したいppmファイルを、事前に`ppm`ディレクトリへコピーしておきます。

`jpeg`コマンドを実行してファイルを変換します。
下記は、「quality を 100 で、 coffee-cup-and-coffee-kettle.ppm　を outfile.jpg という名前で変換する」という例です。
コマンドの実行は`/app`ディレクトリで行ってください。

```sh
./jpeg -q 100 ppm/coffee-cup-and-coffee-kettle.ppm out/outfile.jpg
```

### 参考記事

https://github.com/thorfdbg/libjpeg

https://www.autumn-color.com/archives/2482
