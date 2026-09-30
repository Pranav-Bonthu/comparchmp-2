// Test bench for top: simulates a little over one full color-wheel cycle (1 s).
//
// Run with sim.bat, then open the waveform with wave.bat.
//
// Waveform size warning: do NOT $dumpvars the whole design. The counters toggle
// every clock, and 12 million clocks of that makes a multi-gigabyte file.
// Dump only the slow signals (the duties) plus the three LED outputs.

`timescale 1ns / 1ps

module top_tb;

    logic clk = 1'b0;
    logic RGB_R, RGB_G, RGB_B;

    // 12 MHz clock: 83.333 ns period
    always #41.667 clk = ~clk;

    top dut (
        .clk   (clk),
        .RGB_R (RGB_R),
        .RGB_G (RGB_G),
        .RGB_B (RGB_B)
    );

    initial begin
        $dumpfile("sim/top_tb.fst");
        // Duty values: display these in GTKWave as Analog (the required plot)
        $dumpvars(0, dut.r_duty, dut.g_duty, dut.b_duty);
        $dumpvars(0, dut.sector);
        // LED pins: useful to zoom in on and confirm the PWM duty visually
        $dumpvars(0, RGB_R, RGB_G, RGB_B);

        // TODO (optional but good for the report): add checks, e.g.
        //   - sector returns to 0 after exactly 1 s
        //   - at every sample, one duty is MAX, one is 0 (see hsv_to_duty.sv)

        #1_100_000_000;   // 1.1 s of simulated time
        $display("Simulation finished at %.3f s", $realtime / 1e9);
        $finish;
    end

endmodule
