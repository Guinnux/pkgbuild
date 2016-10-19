
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# specify the cross compiler
set(CMAKE_C_COMPILER $ENV{CHOST}-gcc)
set(CMAKE_CXX_COMPILER $ENV{CHOST}-g++)

# Find out the sysroot of the toolchain.
execute_process(COMMAND $ENV{CHOST}-g++ --print-sysroot
  OUTPUT_VARIABLE toolchain_sysroot
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
get_filename_component(toolchain_sysroot "${toolchain_sysroot}" ABSOLUTE)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH "${toolchain_sysroot}" CACHE INTERNAL "" FORCE)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
