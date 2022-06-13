module RegFile(clock, regWrite, readReg1, readReg2, writeReg, writeData, readData1, readData2);
    input clock;
    input regWrite;
    
    input [4:0] readReg1, readReg2, writeReg;
    input [31:0] writeData;
    
    output [31:0] readData1, readData2;
    
    reg [31:0] reg_mem [0:31];
    
    initial begin
       // --snip 
    end
    
    assign readData1 = reg_mem[readReg1];
    assign readData2 = reg_mem[readReg2];
    
    always @(posedge clock) begin
       if(writeReg == 1)
           reg_mem[regWrite] = writeData; 
    end
    
endmodule

module RegFile_test;
    
endmodule