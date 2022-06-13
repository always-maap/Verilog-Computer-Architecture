module Mux3(readData, aluOut, memToReg, writeData);
    input [31:0] readData, aluOut;
    input memToReg;
    
    output reg [31:0] writeData;
    
    always @(*) begin
        case(memToReg)
            0: writeData <= aluOut;
            1: writeData <= readData;
        endcase
    end
endmodule

module Mux3_test;
    
endmodule