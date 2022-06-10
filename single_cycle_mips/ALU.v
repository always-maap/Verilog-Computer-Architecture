module ALU(control, A, B, out, zero);
    input [2:0] control;
    input [31:0] A, B;
    
    output reg [31:0] out;
    output zero;
    
    // 
    assign zero = (out == 0);
    
    /*
    
    */
    always @(control, A, B) begin
        case(control)
            3'b000: out <= A & B;
            3'b001: out <= A | B;
            3'b010: out <= A + B;
            3'b110: out <= A - B;
            3'b111: out <= A < B;
            default: out <= 0;
        endcase
    end
endmodule

module ALU_test;
    reg [2:0] control;
    reg [31:0] A, B;
    
    wire zero;
    wire [31:0] out;
    
    ALU alu(control, A, B, out, zero);
    
    initial begin
       control = 3'b000;
       A = 0;
       B = 1;
       
       #10
       control = 3'b001;
       A = 0;
       B = 1;
       
       #10
       control = 3'b010;
       A = 2;
       B = 2;
       
       #10
       control = 3'b110;
       A = 5;
       B = 2;
       
       #10
       control = 3'b111;
       A = 3;
       B = 2;
    end
endmodule