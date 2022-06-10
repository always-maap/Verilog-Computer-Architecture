module InstMem(clock, address, instruction);
    input clock;
    input [31:0] address;
    
    output reg[31:0] instruction;
    
    reg [31:0] memory [63:0];
    
    integer i;
    initial begin
        for(i = 0; i < 64; i = i + 1) begin
            memory[i] = 32'b0;
        end
    end
    
    always @(posedge clock) begin
       instruction <= memory[address]; 
    end
endmodule

module InstMem_test;
    reg clock = 1;
    reg [31:0] address;
    
    wire [31:0] instruction;
    
    InstMem instMem(clock, address, instruction);
    
    always #10 clock = ~clock;
    
    initial begin
        address = 32'b0001;
        
        #20
        address = 32'b0010;
        
        #20
        address = 32'b1111;
    end
endmodule