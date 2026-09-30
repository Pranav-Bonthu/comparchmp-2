@echo off
REM Build and upload for the iceBlinkPico (iCE40UP5K-SG48). Run from the OSS CAD Suite shell.
REM   build.bat        -> build only
REM   build.bat prog   -> build, then upload to the board
if not exist build mkdir build
yosys -p "synth_ice40 -noabc -top top -json build\mp2.json" src\top.sv src\hue_gen.sv src\hsv_to_duty.sv src\pwm.sv || exit /b 1
nextpnr-ice40 --up5k --package sg48 --json build\mp2.json --pcf iceBlinkPico.pcf --asc build\mp2.asc || exit /b 1
icepack build\mp2.asc build\mp2.bin || exit /b 1
if /i "%1"=="prog" dfu-util --device 1d50:6146 --alt 0 -D build\mp2.bin -R
