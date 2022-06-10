module RegFile(clock, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
    input clock;
    input RegWrite;
    
    input [4:0] ReadReg1, ReadReg2, WriteReg;
    input [31:0] WriteData;
    
    output [31:0] ReadData1, ReadData2;
    
    reg [31:0] reg_mem [0:31];
    
endmodule

module RegFile_test;
    
endmodule