@echo off

:: ***********************************************************************
:: Build Environment & CMAKE configuration

call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x86_amd64
set CMAKE="%PROGRAMFILES(x86)%\CMake\bin\cmake.exe"
set CMAKE_GENERATOR="CodeBlocks - NMake Makefiles"

:: ***********************************************************************
:: Project dependencies configuration

:: Path to the Caffe installation
set CAFFE_PATH=C:/path/to/Caffe-willyd/install

:: ***********************************************************************
:: Project names

set build_mode=Release
set source_dir_name=py-leveldb-windows
set build_dir_name=%source_dir_name%-build
set install_dir_path=../%source_dir_name%-install

:: ***********************************************************************
:: ***********************************************************************
:: ***********************************************************************

cd ..
if not exist build_dir_name (
	mkdir %build_dir_name%
)
cd %build_dir_name%

:: LevelDB depends on Boost under Windows
set LEVELDB_INCLUDE_DIR=%CAFFE_PATH%/include
set LEVELDB_LIBRARY_DIR=%CAFFE_PATH%/lib
set LEVELDB_LIBRARY=^
leveldb.lib;^
libboost_thread-vc120-mt-1_58.lib;^
libboost_system-vc120-mt-1_58.lib;^
libboost_regex-vc120-mt-1_58.lib;^
libboost_python-vc120-mt-1_58.lib;^
libboost_filesystem-vc120-mt-1_58.lib;^
libboost_date_time-vc120-mt-1_58.lib;^
libboost_chrono-vc120-mt-1_58.lib

set CMAKE_PARAMETERS=^
-DCMAKE_INSTALL_PREFIX=%install_dir_path% ^
-DCMAKE_BUILD_TYPE=%build_mode%

:: ----------------------------------------------------
%CMAKE% %CMAKE_PARAMETERS% -G %CMAKE_GENERATOR% ..\%source_dir_name%
%CMAKE% --build .
nmake install

PAUSE








