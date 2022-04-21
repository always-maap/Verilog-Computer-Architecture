module fourbit_CLA(a,b,ci,co,s);
   input [3:0]a,b;
   output [3:0]s;
   input ci;
   output co;
   
   wire [3:0]G,P,C;
   
   assign G = a&b;
   assign P = a^b;
   assign co=G[3]+ (P[3]&G[2]) + (P[3]&P[2]&G[1]) +  (P[3]&P[2]&P[1]&G[0]) + (P[3]&P[2]&P[1]&P[0]&ci);
   assign C[3]=G[2] + (P[2]&G[1]) + (P[2]&P[1]&G[0]) +  (P[2]&P[1]&P[0]&ci);
   assign C[2]=G[1] + (P[1]&G[0]) + (P[1]&P[0]&ci);
   assign C[1]=G[0] + (P[0]&ci);
   assign C[0]=ci;
   assign s = P^C;
endmodule

`timescale 1ns / 1ps

module fourbit_CLA_tb;
	reg [3:0] a,b;
	reg ci;
	wire co;
	wire [3:0] s;

	fourbit_CLA uut (.a(a), .b(b), .ci(ci), .co(co), .s(s));

	initial begin
		a = 0;
		b = 0;
		ci = 0;

		#10;
		a=4'b0001;
		b=4'b1110;
		ci=0;
		
				#10;
		a=4'b0100;
		b=4'b1011;
		ci=0;
		
				#10;
		a=4'b1101;
		b=4'b0111;
		ci=1;
		
				#10;
		a=4'b0100;
		b=4'b0110;
		ci=1;
		
				#10;
		a=4'b1001;
		b=4'b0101;
		ci=0;
		
				#10;
		a=4'b1100;
		b=4'b1100;
		ci=1;
	end     
endmodule

module twelvebit_CLA(a,b,sum,cin,cout);
    input [11:0] a,b ;
    input cin;
    output [11:0] sum;
    output cout;
    wire c4,c8;

    fourbit_CLA u1(a[3:0],b[3:0],cin,c4,sum[3:0]);
    fourbit_CLA u2(a[7:4],b[7:4],c4,c8,sum[7:4]);
    fourbit_CLA u3(a[11:8],b[11:8],c8,cout,sum[11:8]);
endmodule

`timescale 1ns / 1ps

module twelvebit_cla_tb;
	reg [11:0] a,b;
	reg cin;
	wire [11:0] sum;
	wire cout;

	twelvebit_CLA uut (.a(a), .b(b), .sum(sum), .cin(cin), .cout(cout));

	initial begin
		a = 0;
		b = 0;
		cin = 0;

		#10;
		a=12'b000000011001;
		b=12'b110011101001;
		cin=1;
		
		#10;
		a=12'b111101000000;
		b=12'b111011000111;
		cin=0;
		
		#10;
		a=12'b100000000000;
		b=12'b000000000011;
		cin=1;
		
		#10;
		a=12'b111111110000;
		b=12'b000000000111;
		cin=0;
		
		#10;
		a=12'b101010010011;
		b=12'b000111111000;
		cin=1;
		
		#10;
		a=12'b111111111111;
		b=12'b111111111111;
		cin=0;    
	end
endmodule
