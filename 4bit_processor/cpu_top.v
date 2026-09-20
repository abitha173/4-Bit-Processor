module cpu_top;

reg clk;
reg we;
reg [1:0] addr;
reg [3:0] data_in;
reg [3:0] A, B;
reg [2:0] opcode;

wire [3:0] Y;
wire [3:0] reg_data;
wire [7:0] mem_data;
wire alu_en;

// ALU
alu uut_alu (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Y(Y)
);

// Register File
register_file uut_reg (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(reg_data)
);

// Memory
memory uut_mem (
    .addr({2'b00, addr}),
    .data(mem_data)
);

// Control Unit
control_unit uut_ctrl (
    .opcode(opcode),
    .alu_en(alu_en)
);

initial begin
    $dumpfile("cpu_wave.vcd");
    $dumpvars(0, cpu_top);

    clk = 0;
    we = 1;

    // Write values into registers
    addr = 2'b00; data_in = 4'b0101; #10;
    addr = 2'b01; data_in = 4'b0011; #10;

    // ALU inputs
    A = 4'b0101;
    B = 4'b0011;

    opcode = 3'b000; #10; // ADD
    opcode = 3'b001; #10; // SUB
    opcode = 3'b010; #10; // AND
    opcode = 3'b011; #10; // OR
    opcode = 3'b100; #10; // XOR
    opcode = 3'b101; #10; // NOT

    $finish;
end

always #5 clk = ~clk;

endmodule