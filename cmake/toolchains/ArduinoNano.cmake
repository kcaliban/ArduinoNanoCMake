include_guard()

# Target system is an Arduino Nano with AVR processor
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

# Set the compilers
set(CMAKE_C_COMPILER avr-gcc)
set(CMAKE_CXX_COMPILER avr-g++)

# Set MCU to Atmega328p found on Arduino Nano, enable warnings,
# optimize for size
set(CMAKE_C_FLAGS_INIT "-mmcu=atmega328p -Wall -Os")
set(CMAKE_CXX_FLAGS_INIT "-mmcu=atmega328p -Wall -Os")
set(CMAKE_EXE_LINKER_FLAGS_INIT "-mmcu=atmega328p")

# Tool and flags for converting ELF to Intel HEX
set(CMAKE_OBJCOPY avr-objcopy)
set(CMAKE_OBJCOPY_FLAGS -j .text -j .data -O ihex)

# Tool and flags for flashing to Arduino
set(CMAKE_FLASHTOOL avrdude)
set(CMAKE_FLASHTOOL_FLAGS -c arduino -p m328p)

# C++23 because why not
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# For use in IDE
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Include paths for AVR library
include_directories(SYSTEM /usr/avr/include)

# Modules are not even supported in non-embedded env yet 
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)
