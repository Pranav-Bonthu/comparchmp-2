// Test bench for mp2.sv: simulates 1.1 s (one full color-wheel cycle + margin).
//
// Only the slow signals are dumped. Dumping the counters too would make a
// multi-gigabyte waveform file.
//
// In GTKWave: add dut.r_duty / g_duty / b_duty, right-click ->
// Data Format -> Analog -> Step, then Insert Analog Height Extension.

`timescale 1ns / 1ps

module mp2_tb;

    logic clk = 1'b0;
    logic RGB_R, RGB_G, RGB_B;

    always #41.667 clk = ~clk;   // 12 MHz

    top dut (
        .clk   (clk),
        .RGB_R (RGB_R),
        .RGB_G (RGB_G),
        .RGB_B (RGB_B)
    );

    initial begin
        $dumpfile("mp2_tb.fst");
        $dumpvars(0, dut.r_duty, dut.g_duty, dut.b_duty, dut.sector);
        $dumpvars(0, RGB_R, RGB_G, RGB_B);

        #1_100_000_000;   // 1.1 s
        $display("Simulation finished at %.3f s", $realtime / 1e9);
        $finish;
    end

endmodule
