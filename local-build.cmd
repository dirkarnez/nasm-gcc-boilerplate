REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOAD_DIR=%USERPROFILE%\Downloads
set DOWNLOAD_DIR_LINUX=%DOWNLOAD_DIR:\=/%
SET PATH=%DOWNLOAD_DIR%\PortableGit\bin;%DOWNLOAD_DIR%\nasm-2.15.05;%DOWNLOAD_DIR%\mingw64-win32;%DOWNLOAD_DIR%\mingw64-win32\bin;%DOWNLOAD_DIR%\cmake-3.22.0-rc1-windows-x86_64\bin;

:rebuild_and_startapp
cmake.exe -G"MinGW Makefiles" -DCMAKE_ASM_NASM_COMPILER="%DOWNLOAD_DIR_LINUX%/nasm-2.15.05/nasm.exe" -DCMAKE_CXX_COMPILER="%DOWNLOAD_DIR_LINUX%/LLVM-13.0.0-win64/bin/clang++.exe" -DCMAKE_C_COMPILER="%DOWNLOAD_DIR_LINUX%/LLVM-13.0.0-win64/bin/clang.exe" -B./build
cd build
mingw32-make.exe
cd ..
pause
GOTO rebuild_and_startapp
pause