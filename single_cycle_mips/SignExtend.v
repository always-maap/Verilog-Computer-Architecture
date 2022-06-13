module SignExtend(instruction, extended);
    input [15:0] instruction;
    output reg [31:0] extended;
    
    always @(instruction) begin
       extended[31:0] <= instruction[15:0]; 
    end
endmodule

module SignExtend_test;
    reg [15:0] instruction;
    
    wire [31:0] extended;
    
    SignExtend signExtend(instruction, extended);
    
    initial begin
        instruction = 0;
        
        #20
        instruction = 5;
    end
endmodule