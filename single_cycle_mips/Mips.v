module Mips(clock, reset, PCout, instruction);
    input clock, reset;
    
    wire [31:0] PCin;
    output wire [31:0] PCout;
    PC pc(clock, reset, PCin, PCout);
    
    output wire [31:0] instruction;
    InstMem instMem(clock, PCout, instruction);
    
    assign PCin = PCout;
endmodule

module Mips_test;
    reg clock = 1, reset = 1;
    
    always #10 clock = ~clock;
    
    wire [31:0] PCout;
    wire [31:0] instruction;
    
    Mips mips(clock, reset, PCout, instruction);
    
    initial begin
        #10
        reset = 0;
        
        #1000
        $finish;
    end
endmodule