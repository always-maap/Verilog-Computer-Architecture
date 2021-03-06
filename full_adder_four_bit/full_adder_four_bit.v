module full_adder_four_bit(A, B, Ci, Sum, Cout);
	input [3:0] A, B;
	input Ci;
	output [3:0] Sum;
	output Cout;
	wire c1, c2, c3;
	
	full_adder FA0 (A[0], B[0], Cin, Sum[0], c1);
	full_adder FA1 (A[1], B[1], Cin, Sum[1], c2);
	full_adder FA2 (A[2], B[2], Cin, Sum[2], c3);
	full_adder FA3 (A[3], B[3], Cin, Sum[3], Cout);
endmodule