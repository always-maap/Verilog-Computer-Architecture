module DataMemory(clock, address, writeData, memWrite, memRead, readData);
    input clock;
    input [6:0] address;
    input memWrite, memRead;
    input [31:0] writeData;
    
    output reg [31:0] readData;
    
    reg [31:0] Mem [0:127];
    
    always @(posedge clock) begin
        if(memWrite == 1)
            Mem[address[6:2]] <= writeData;
    end
    
    always @(negedge clock) begin
        if(memRead == 1)
            readData <= Mem[address[6:2]];
    end
endmodule

module DataMemory_test;
    
endmodule