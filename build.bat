@echo off
REM Run from the OSS CAD Suite shell.
REM   build.bat        -> build mp2.bin
REM   build.bat prog   -> build, then upload to the board
REM   build.bat sim    -> run the test bench, then open GTKWave
if /i "%1"=="sim" (
    iverilog -g2012 -o mp2_tb.vvp mp2_tb.sv mp2.sv || exit /b 1
    vvp mp2_tb.vvp -fst || exit /b 1
    gtkwave mp2_tb.fst
    exit /b 0
)
yosys -p "synth_ice40 -noabc -top top -json mp2.json" mp2.sv || exit /b 1
nextpnr-ice40 --up5k --package sg48 --json mp2.json --pcf iceBlinkPico.pcf --asc mp2.asc || exit /b 1
icepack mp2.asc mp2.bin || exit /b 1
if /i "%1"=="prog" dfu-util --device 1d50:6146 --alt 0 -D mp2.bin -R
