// Hue -> RGB duty cycles (purely combinational).
//
// Each color channel is, in every 60-degree sector, one of four things:
//   OFF   duty = 0
//   ON    duty = MAX_DUTY
//   UP    duty = step                (ramping 0 -> MAX_DUTY)
//   DOWN  duty = MAX_DUTY - step     (ramping MAX_DUTY -> 0)
//
// Fill in this table from the waveform figure in the assignment PDF
// before writing any code, then check your table against the figure:
//
//   sector | hue range  |  R  |  G  |  B
//   -------+------------+-----+-----+-----
//     0    |   0 -  60  |  ?  |  ?  |  ?
//     1    |  60 - 120  |  ?  |  ?  |  ?
//     2    | 120 - 180  |  ?  |  ?  |  ?
//     3    | 180 - 240  |  ?  |  ?  |  ?
//     4    | 240 - 300  |  ?  |  ?  |  ?
//     5    | 300 - 360  |  ?  |  ?  |  ?
//
// Sanity check: at every hue, exactly one channel is ON, one is OFF,
// and one is ramping.

module hsv_to_duty #(
    parameter int MAX_DUTY = 250
) (
    input  logic [2:0] sector,
    input  logic [7:0] step,
    output logic [7:0] r_duty,
    output logic [7:0] g_duty,
    output logic [7:0] b_duty
);

    // TODO: compute the rising and falling ramp values from step

    // TODO: always_comb with a case on sector, one branch per row of the table above

    // Placeholder so the design compiles before you fill it in. Replace this block.
    always_comb begin
        r_duty = '0;
        g_duty = '0;
        b_duty = '0;
    end

endmodule
