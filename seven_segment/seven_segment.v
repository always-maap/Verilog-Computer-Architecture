module seven_segment(A1, B1, C1, D1, a, b, c, d, e, f, g);
  input A1, B1, C1, D1;
  output a, b, c, d, e, f, g;
  
  assign a = A1 | (C1) | (B1&D1) | (~B1&~D1);
  assign b = (C1&D1) | (~B1) | (~C1&~D1);
  assign c = (D1) | (B1) | (~C1);
  assign d = (A1) | (~B1&C1) | (~B1&~D1) | (C1&~D1) | ((B1&~C1)&D1);
  assign e = (C1&~D1) | (~B1&~D1);
  assign f = A1 | (B1&~D1) | (~C1&~D1) | (B1&~C1);
  assign g = A1 | (~B1&C1) | (C1&D1) | (B1&~C1);
endmodule