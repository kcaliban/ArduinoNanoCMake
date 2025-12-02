cmake_minimum_required(VERSION 4.0)
project(Blink)

add_subdirectory(src)

if(NOT SERIAL_PORT)
    set(SERIAL_PORT /dev/ttyUSB0)
endif()

if(NOT BAUD_RATE)
    set(BAUD_RATE 115200)
endif()

message(STATUS "Using serial port ${SERIAL_PORT} with baud rate ${BAUD_RATE}")

add_custom_target(binary
    COMMAND ${CMAKE_OBJCOPY} ${CMAKE_OBJCOPY_FLAGS} $<TARGET_FILE:BlinkExe> bin.hex
    BYPRODUCTS bin.hex
    DEPENDS BlinkExe)

add_custom_target(flash
    COMMAND ${CMAKE_FLASHTOOL} ${CMAKE_FLASHTOOL_FLAGS} -P ${SERIAL_PORT} -b ${BAUD_RATE} -U flash:w:bin.hex
    DEPENDS bin.hex)