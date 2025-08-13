`timescale 1ns/1ps

module two_bit_adder_tb;
  reg  [1:0] A, B;
  wire [2:0] SUM;

  two_bit_adder dut(.A(A), .B(B), .SUM(SUM));

  integer i, j;
  initial begin
    $monitor("t=%0t  A=%b  B=%b  SUM=%b", $time, A, B, SUM);

    // optional VCD for open-source sims
    $dumpfile("wave.vcd"); 
    $dumpvars(0, two_bit_adder_tb);

    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i[1:0];  B = j[1:0];
        #1; // allow settle
        if (SUM !== (A + B)) begin
          $display("ERROR: A=%b B=%b expected=%b got=%b", A, B, (A+B), SUM);
          $fatal; // non-zero exit on failure
        end
        #9;
      end
    end
    $display("PASS: all combinations OK");
    $finish;
  end
endmodule