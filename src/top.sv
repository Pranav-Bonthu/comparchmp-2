// ENGR 3410 Miniproject 2: HSV color wheel on the iceBlinkPico RGB LED
//
// Block diagram:
//
//   clk ─► hue_gen ──sector,step──► hsv_to_duty ──r/g/b_duty──► pwm (x3) ──► RGB_R/G/B
//
// The wiring here is done; the logic inside each submodule is yours to write.

module top (
    input  logic clk,      // 12 MHz oscillator
    output logic RGB_R,    // active low
    output logic RGB_G,    // active low
    output logic RGB_B     // active low
);

    // One full trip around the wheel per second at 12 MHz.
    // See README "Timing math" for how these three numbers relate.
    localparam int CLK_HZ     = 12_000_000;
    localparam int PWM_PERIOD = 250;            // clocks per PWM period (also max duty)
    localparam int STEP_CLKS  = CLK_HZ / (6 * PWM_PERIOD);  // clocks per hue step

    logic [2:0] sector;    // 0..5, one per 60 degrees of hue
    logic [7:0] step;      // 0..PWM_PERIOD-1, position inside the sector
    logic [7:0] r_duty, g_duty, b_duty;
    logic r_on, g_on, b_on;

    hue_gen #(
        .STEP_CLKS (STEP_CLKS),
        .STEPS     (PWM_PERIOD)
    ) u_hue (
        .clk    (clk),
        .sector (sector),
        .step   (step)
    );

    hsv_to_duty #(
        .MAX_DUTY (PWM_PERIOD)
    ) u_map (
        .sector (sector),
        .step   (step),
        .r_duty (r_duty),
        .g_duty (g_duty),
        .b_duty (b_duty)
    );

    pwm #(.PERIOD(PWM_PERIOD)) u_pwm_r (.clk(clk), .duty(r_duty), .out(r_on));
    pwm #(.PERIOD(PWM_PERIOD)) u_pwm_g (.clk(clk), .duty(g_duty), .out(g_on));
    pwm #(.PERIOD(PWM_PERIOD)) u_pwm_b (.clk(clk), .duty(b_duty), .out(b_on));

    // LEDs are active low
    assign RGB_R = ~r_on;
    assign RGB_G = ~g_on;
    assign RGB_B = ~b_on;

endmodule
