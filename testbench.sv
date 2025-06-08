module ALU_32bit_tb;
    reg [31:0] A;
    reg [31:0] B;
    reg [2:0] opcode;
    reg enable;
    wire [31:0] result;
    ALU_32bit uut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .enable(enable),
        .result(result)
    );
    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        enable = 1;
        A = 32'h00000005; B = 32'h00000003; opcode = 3'b000;
        #10;
        $display("A + B = %h", result);
        A = 32'h00000005; B = 32'h00000003; opcode = 3'b001;
        #10;
        $display("A - B = %h", result);
        A = 32'h00000005; opcode = 3'b010;
        #10;
        $display("A + 1 = %h", result);
        A = 32'h00000005; opcode = 3'b011;
        #10;
        $display("A - 1 = %h", result);
        A = 32'h00000005; opcode = 3'b100;
        #10;
        $display("A = %h", result);
        A = 32'h00000005; opcode = 3'b101;
        #10;
        $display("A complement = %h", result);
        A = 32'h00000005; B = 32'h00000003; opcode = 3'b110;
        #10;
        $display("A OR B = %h", result);
        A = 32'h00000005; B = 32'h00000003; opcode = 3'b111;
        #10;
        $display("A AND B = %h", result);
        enable = 0;
        A = 32'h00000005; B = 32'h00000003; opcode = 3'b000;
        #10;
        $display("ALU disabled, result = %h", result);
        $finish;
    end
endmodule
