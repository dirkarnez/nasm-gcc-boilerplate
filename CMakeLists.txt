cmake_minimum_required(VERSION 3.18)

# uncomment these 2 lines if using clang
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -target x86_64-pc-windows-gnu")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -target x86_64-pc-windows-gnu")

project(nasm-clang-boilerplate)

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
set(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS nasm asm)

if(WIN32)
    if(CMAKE_C_SIZEOF_DATA_PTR EQUAL 8)
      SET(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
    else()
      SET(CMAKE_ASM_NASM_OBJECT_FORMAT win32)
    endif()
endif()

set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")
set(ASM_DIALECT "_NASM")
# include(CMakeASMInformation)
# include(CMakeTestASMCompiler)
# set(ASM_DIALECT)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME}
    "src/cpp/main.cpp"
    "src/asm/factorial.asm"
)