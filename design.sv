module ALU_32bit (input [31:0] A, input [31:0] B,input [2:0] opcode,input enable,output reg [31:0] result);
always @(*) begin
    if (enable) begin
        case (opcode)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b010: result = A + 1;
            3'b011: result = A - 1;
            3'b100: result = A;
            3'b101: result = ~A;
            3'b110: result = A | B;
            3'b111: result = A & B;
            default: result = 32'b0;
        endcase
    end
    else begin
        result = 32'b0;
    end
end

endmodule
