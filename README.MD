# AVR CMake Starter
Simple template project for using CMake for building and flashing to an Arduino Nano.

## Preset
To configure, build and flash, run
```
cmake --workflow --preset configure-build-flash
```
To change serial port and baud rate, change `SERIAL_PORT` and `BAUD_RATE`
in `CMakePresets.json`.

## Configuring
Run
```
cmake -B build --toolchain cmake/toolchains/ArduinoNano.cmake -G Ninja
```
to configure. To specify a port and baud rate for flashing:
```
cmake -B build --toolchain cmake/toolchains/ArduinoNano.cmake -G Ninja -DSERIAL_PORT=/dev/ttyUSB0 -DBAUD_RATE=115200
```

## Building
```
cmake --build build
```

## Flashing
Also builds if changes are detected.
```
cmake --build build --target flash
```