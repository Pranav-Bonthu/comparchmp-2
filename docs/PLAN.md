# MP2 Plan

**Due:** Fri Oct 2, 2026, at the start of class (1:00 pm ET), as a **PDF uploaded to Canvas**.

## Requirements (from the assignment)

- [ ] LED cycles smoothly around the HSV wheel using PWM, **once per second**, matching the waveform figure
- [ ] Circuit written in **SystemVerilog**
- [ ] **Test bench** + Icarus Verilog simulation showing **at least one full cycle**
- [ ] Report PDF: design explanation + operation
- [ ] **GTKWave screenshot** of R/G/B duty cycles, shown in **analog** format, vs. time
- [ ] Link to source files (this repo, public)
- [ ] Link to **video demo** on the iceBlinkPico

## Schedule

The toolchain and build scripts are already set up and tested. The empty scaffold
simulates and builds cleanly, so each step below is only your own logic.

### Wed 9/30 (evening, ~2 h)
- [ ] Fill in the sector table at the top of `src/hsv_to_duty.sv` from the PDF figure (on paper first)
- [ ] Write `src/pwm.sv`
- [ ] Quick check: temporarily hard-code `r_duty` in `top.sv` to a few values (0, 125, 250), run `sim.bat`, and zoom in on `RGB_R` in GTKWave. The low time should match (remember the LED is active low)
- [ ] Write `src/hue_gen.sv`
- [ ] Commit + push

### Thu 10/1 (~3 h)
- [ ] Write `src/hsv_to_duty.sv`
- [ ] `sim.bat` → `wave.bat`: check `sector` wraps 5→0 at exactly 1.000 s and the three duty traces match the figure
- [ ] Take the analog GTKWave screenshot (steps in the README) → `images/`
- [ ] `build.bat prog`: flash the board and check it looks smooth and takes about 1 s per cycle (time 10 cycles with a stopwatch)
- [ ] Record the demo video (phone, ~15-20 s, show a few full cycles; dim the room so the colors read on camera)
- [ ] Upload the video (YouTube unlisted / Google Drive / OneDrive with "anyone with link") and test the link in a private window
- [ ] Commit + push

### Thu 10/1 night
- [ ] Write the report from `docs/report_outline.md` → export to PDF
- [ ] Check that both links in the PDF are clickable and work when logged out

### Fri 10/2 morning (buffer)
- [ ] Final read-through, submit the PDF on Canvas **before 1:00 pm**
- [ ] Check the Canvas submission shows the file

## Pitfalls to watch for

- **Active-low LEDs.** `top.sv` already inverts, so `pwm.out = 1` means the LED is on.
- **Off-by-one at the ends.** With `out = (count < duty)`, duty 0 must be fully off and duty 250 fully on. Check both in simulation.
- **Counter widths.** 8000 needs 13 bits; 250 fits in 8 bits. A counter that is too narrow wraps early and the cycle won't be 1 s.
- **Huge waveforms.** Don't `$dumpvars` the whole design (see the comment in `tb/top_tb.sv`).
- **Colors look uneven on the real LED.** The eye's response isn't linear, so the mixed colors (yellow, cyan, magenta) may look brief or washed out. That's fine: the spec asks you to match the linear waveforms. It's worth a sentence in the report, though (gamma correction would be the fix).
