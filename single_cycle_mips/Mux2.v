module Mux2(readData2, extended, aluSrc, B);
    input [31:0] readData2, extended;
    input aluSrc;
    
    output reg [31:0] B;
    
    always @(readData2, extended, aluSrc) begin
        case(aluSrc)
            0: B <= readData2;
            1: B <= extended;
        endcase
    end
endmodule

module Mux2_test;
    
endmodule
