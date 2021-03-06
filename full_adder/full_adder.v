module full_adder_code(A, B, Cin, Cout, Sum);
	input A, B, Cin;
	output Cout, Sum;
	assign Sum = A ^ B ^ Cin;
	assign Cout = (Cin & (A ^ B)) || (A & B);
endmodule