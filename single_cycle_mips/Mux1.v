module Mux1(inst20_16, inst15_11, regDst, writeReg);
    input [20:16] inst20_16;
    input [15:11] inst15_11;
    input regDst;
    
    output reg [4:0] writeReg;
    
    always @(inst20_16, inst15_11, regDst) begin
        case(regDst)
            0: writeReg <= inst20_16;
            1: writeReg <= inst15_11;
        endcase
    end
endmodule

module Mux1_test;
    
endmodule