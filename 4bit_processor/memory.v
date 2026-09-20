module memory(
    input [3:0] addr,
    output [7:0] data
);

reg [7:0] mem [0:15];

initial begin
    mem[0] = 8'b00000011;
    mem[1] = 8'b00000101;
    mem[2] = 8'b00001010;
    mem[3] = 8'b00001111;
end

assign data = mem[addr];

endmodule