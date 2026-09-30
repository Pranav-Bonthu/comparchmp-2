// ENGR 3410 Miniproject 2: HSV color wheel on the iceBlinkPico RGB LED
//
// Cycles the RGB LED smoothly around the HSV color wheel once per second
// using PWM on each color.
//
// Timing (12 MHz clock):
//   PWM period    = 250 clocks            -> 48 kHz PWM, duty 0..250
//   hue           = 6 sectors x 250 steps -> 1500 steps per cycle
//   clocks / step = 12,000,000 / 1500     = 8000 -> exactly 1 s per cycle

module top (
    input  logic clk,      // 12 MHz oscillator
    output logic RGB_R,    // active low
    output logic RGB_G,    // active low
    output logic RGB_B     // active low
);

    localparam int PWM_PERIOD = 250;
    localparam int STEP_CLKS  = 8000;

    // ---------------------------------------------------------------
    // 1. Hue counter: step 0..249 inside sector 0..5
    // ---------------------------------------------------------------
    logic [2:0] sector;
    logic [7:0] step;

    // TODO: prescale counter -> one-cycle tick every STEP_CLKS clocks
    // TODO: step advances on tick, wraps at PWM_PERIOD-1
    // TODO: sector advances when step wraps, wraps at 5

    // ---------------------------------------------------------------
    // 2. Hue -> duty cycles
    //    In each sector every color is OFF (0), ON (PWM_PERIOD),
    //    UP (step), or DOWN (PWM_PERIOD - step). Fill this in from
    //    the waveform figure in the assignment:
    //
    //    sector | hue       |  R  |  G  |  B
    //      0    |   0 -  60 |  ?  |  ?  |  ?
    //      1    |  60 - 120 |  ?  |  ?  |  ?
    //      2    | 120 - 180 |  ?  |  ?  |  ?
    //      3    | 180 - 240 |  ?  |  ?  |  ?
    //      4    | 240 - 300 |  ?  |  ?  |  ?
    //      5    | 300 - 360 |  ?  |  ?  |  ?
    // ---------------------------------------------------------------
    logic [7:0] r_duty, g_duty, b_duty;

    // TODO: always_comb case on sector

    // ---------------------------------------------------------------
    // 3. PWM: one counter 0..PWM_PERIOD-1 shared by all three colors;
    //    a color is on while counter < its duty
    // ---------------------------------------------------------------
    logic r_on, g_on, b_on;

    // TODO: PWM counter and the three compares

    // Placeholders so this compiles before you fill it in. Delete these.
    assign sector = '0;
    assign step   = '0;
    assign r_duty = '0;
    assign g_duty = '0;
    assign b_duty = '0;
    assign r_on   = 1'b0;
    assign g_on   = 1'b0;
    assign b_on   = 1'b0;

    // LEDs are active low
    assign RGB_R = ~r_on;
    assign RGB_G = ~g_on;
    assign RGB_B = ~b_on;

endmodule
