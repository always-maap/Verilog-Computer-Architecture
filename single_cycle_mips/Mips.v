module Mips(clock, reset, PCout, instruction);
    input clock, reset;
    
    wire [31:0] PCin;
    output wire [31:0] PCout;
    PC pc(clock, reset, PCin, PCout);
    
    output wire [31:0] instruction;
    InstMem instMem(clock, PCin, instruction);
endmodule

module Mips_test;
    reg clock, reset;
    
    always #10 clock = ~clock;
    
    wire [31:0] PCout;
    wire [31:0] instruction;
    
    Mips mips(clock, reset, PCout, instruction);
    
    initial begin
        // initialize all variables
        clock = 0; reset = 1;
        
        // wait for first negative edge before de-asserting reset
        @(negedge clock) reset = 0;
        #1000
        $finish;
    end
endmodule