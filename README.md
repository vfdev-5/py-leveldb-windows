# Python leveldb wrapper for Caffe & [Caffe-builder](https://github.com/willyd/caffe-builder) under Windows
Helper project to compile Python leveldb wrapper under Windows using CMake.

C++ libraries (leveldb and its dependencies) should be taken from [Caffe-builder](https://github.com/willyd/caffe-builder)'s cache


## Usage
1. Check and setup the configuration in the build_leveldb.bat, e.g
```
set CAFFE_PATH=C:/Caffe-willyd/install 
```
and optionally
```
set build_mode=Release
set source_dir_name=py-leveldb-windows
set build_dir_name=%source_dir_name%-build
set install_dir_path=../%source_dir_name%-install
```

2. Run build_leveldb.bat

3. Copy `%install_dir_path%/leveldb.pyd` and `%install_dir_path%/leveldb.lib` to `%PYTHON_PATH%/Lib/site-packages`

4. Run `python ./test-py-leveldb.py`. If everything is ok, you will get `hello world` response and a folder named `db`.
(Test is taken from https://github.com/happynear/py-leveldb-windows)
