# ENGR 3410 Miniproject 2: HSV Color Wheel

Drives the iceBlinkPico RGB LED with PWM so it cycles smoothly around the HSV
color wheel once per second.

- `mp2.sv`: the circuit
- `mp2_tb.sv`: Icarus Verilog test bench (simulates one full 1 s cycle)
- `iceBlinkPico.pcf`: board pin map

## Running

From the OSS CAD Suite shell (`environment.bat`):

```
build.bat sim     simulate + open GTKWave
build.bat         build mp2.bin
build.bat prog    build + upload to the board
```

## Demo video

_TODO: link_
