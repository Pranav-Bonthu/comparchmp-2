@echo off
REM Compile and run the test bench with Icarus Verilog. Run from the OSS CAD Suite shell.
REM   sim.bat   -> writes sim\top_tb.fst (open it with wave.bat)
if not exist sim mkdir sim
iverilog -g2012 -o sim\top_tb.vvp tb\top_tb.sv src\top.sv src\hue_gen.sv src\hsv_to_duty.sv src\pwm.sv || exit /b 1
vvp sim\top_tb.vvp -fst || exit /b 1
