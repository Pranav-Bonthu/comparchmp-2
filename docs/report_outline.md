# Report outline (target: 2-3 pages PDF)

**Title:** ENGR 3410 Miniproject 2: HSV Color Wheel on the iceBlinkPico
**Name / date**

**Links (put these at the top so the grader finds them fast):**
- Source: https://github.com/Pranav-Bonthu/comparchmp-2
- Video demo: _link_

## 1. Overview (1 paragraph)
What the circuit does: smooth HSV hue cycle, once per second, PWM on the RGB LED.

## 2. Design
- Block diagram (screenshot the Mermaid diagram from the README, or redraw it)
- How hue is represented: 6 sectors × 250 steps
- Timing math table (from the README): 48 kHz PWM, 8000 clocks/step, exactly 1 s
- The sector table: which channel is ON / OFF / UP / DOWN in each sector
- Brief description of each module: `hue_gen`, `hsv_to_duty`, `pwm`, `top`

## 3. Verification
- Test bench description: 12 MHz clock, 1.1 s simulated, which signals are dumped and why
- **GTKWave screenshot**: r/g/b duty in analog format across a full cycle (required)
- Optional: a zoomed-in screenshot showing PWM on `RGB_R` for one duty value
- Point out that the traces match the figure in the assignment

## 4. Hardware results
- Synthesis resource usage (the `ICESTORM_LC` line from `build.bat`)
- Observed behavior on the board and cycle-time check (10 cycles ≈ 10 s)
- Link to video

## 5. Discussion (short)
- Anything that went wrong / was tricky
- Perceived brightness vs. linear PWM (gamma), if you noticed it
