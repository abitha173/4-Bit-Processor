`timescale 1ns/1ps

module tb_alu;

reg [3:0] A;
reg [3:0] B;
reg [2:0] opcode;
wire [3:0] Y;

alu uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Y(Y)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_alu);

    A = 4'b0101;
    B = 4'b0011;

    opcode = 3'b000; #10;
    opcode = 3'b001; #10;
    opcode = 3'b010; #10;
    opcode = 3'b011; #10;
    opcode = 3'b100; #10;
    opcode = 3'b101; #10;

    $finish;
end

endmodule