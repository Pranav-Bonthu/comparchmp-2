// Hue generator: walks the hue angle around the color wheel once per second.
//
// Hue is represented as (sector, step):
//   sector  0..5              which 60-degree slice of the wheel we are in
//   step    0..STEPS-1        how far through that slice we are
//
// Every STEP_CLKS clock cycles, step advances by one. When step wraps from
// STEPS-1 back to 0, sector advances by one (5 wraps back to 0).
//
// Check: 6 sectors * STEPS steps * STEP_CLKS clocks should equal 12,000,000.

module hue_gen #(
    parameter int STEP_CLKS = 8000,
    parameter int STEPS     = 250
) (
    input  logic       clk,
    output logic [2:0] sector,
    output logic [7:0] step
);

    // TODO: a prescale counter that produces a one-cycle tick every STEP_CLKS clocks

    // TODO: step counter, advances on tick, wraps at STEPS-1

    // TODO: sector counter, advances when step wraps, wraps at 5

    // Placeholder so the design compiles before you fill it in. Delete these.
    assign sector = '0;
    assign step   = '0;

endmodule
