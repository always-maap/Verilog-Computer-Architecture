module PC(clock, reset, in, out);
    input clock, reset;
    input [31:0] in;
    
    output reg [31:0] out;
    
    always @(posedge clock) begin
        if(reset == 1)
            out <= 0;
        else
            out <= in + 4;
    end
endmodule

module PC_test;
    reg[31:0] in;
    reg clock = 1;
    reg reset = 0;
    
    wire [31:0] out;
    
    always #10 clock = ~clock;
    
    PC pc(clock, reset, in, out);
    
    initial begin
        reset = 0;
        in = 1;
        
        #20
        in = 2;
        
        #20
        in = 3;
        reset = 1;
        
        #20
        in = 5;
        reset = 0;
    end
endmodule