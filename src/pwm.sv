// Pulse width modulator.
//
// A free-running counter counts 0 .. PERIOD-1 and wraps. The output is high
// while the counter is below duty, so:
//   duty = 0       -> always low   (0%)
//   duty = PERIOD  -> always high  (100%)
//
// At 12 MHz with PERIOD = 250 the PWM frequency is 48 kHz, well above
// anything the eye can see flicker.

module pwm #(
    parameter int PERIOD = 250
) (
    input  logic       clk,
    input  logic [7:0] duty,   // 0..PERIOD
    output logic       out
);

    // TODO: counter that wraps at PERIOD-1

    // TODO: compare the counter to duty to produce out

    // Placeholder so the design compiles before you fill it in. Delete this.
    assign out = 1'b0;

endmodule
