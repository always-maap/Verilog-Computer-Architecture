module ShiftLeft2(in, out);
    input[31:0] in;
    output reg[31:0] out;
    
    always @(in) begin
        out = in << 2;
    end
endmodule

module ShiftLeft2_test;
    reg[31:0] in;
    
    wire [31:0] out;
    
    ShiftLeft2 shiftLeft2(in, out);
    
    initial begin
        in = 32'b0001; // expected: 32'b0100
        
        #20
        in = 32'b1100; // expected: 32'b110000
    end
endmodule