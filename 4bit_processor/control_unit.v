module control_unit(
    input [2:0] opcode,
    output reg alu_en
);

always @(*) begin
    case(opcode)
        3'b000: alu_en = 1; // ADD
        3'b001: alu_en = 1; // SUB
        3'b010: alu_en = 1; // AND
        3'b011: alu_en = 1; // OR
        3'b100: alu_en = 1; // XOR
        3'b101: alu_en = 1; // NOT
        default: alu_en = 0;
    endcase
end

endmodule