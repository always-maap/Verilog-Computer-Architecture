module ArrayMultiplier(a, b, product);
    input [6:0] a;
    input [4:0] b;
    output [11:0] product;
    
    // p0
    and(product[0], a[0], b[0]);
    
    // p1
    wire [1:0] and_1;
    wire carry_1; 

    and(and_1[0], a[1], b[0]);
    and(and_1[1], a[0], b[1]);
    
    HalfAdder HA1_1(and_1[0], and_1[1], product[1], carry_1);

    // p2
    wire [2:0] and_2;
    wire [1:0] carry_2;
    wire sum_2;

    and(and_2[0], a[2], b[0]);
    and(and_2[1], a[1], b[1]);
    and(and_2[2], a[0], b[2]);

    FullAdder FA2_1(and_2[0], and_2[1], carry_1, sum_2, carry_2[0]);
    HalfAdder HA2_1(and_2[2], sum_2, product[2], carry_2[1]);
    
    // p3
    wire [3:0] and_3;
    wire [2:0] carry_3;
    wire [1:0] sum_3;

    and(and_3[0], a[3], b[0]);
    and(and_3[1], a[2], b[1]);
    and(and_3[2], a[1], b[2]);
    and(and_3[3], a[0], b[3]);

    FullAdder FA3_1(and_3[0], and_3[1], carry_2[0], sum_3[0], carry_3[0]);
    FullAdder FA3_2(and_3[2], sum_3[0], carry_2[1], sum_3[1], carry_3[1]);
    HalfAdder HA3_1(and_3[3], sum_3[1], product[3], carry_3[2]);
    
    // p4
    wire [4:0] and_4;
    wire [3:0] carry_4;
    wire [2:0] sum_4;

    and(and_4[0], a[4], b[0]);
    and(and_4[1], a[3], b[1]);
    and(and_4[2], a[2], b[2]);
    and(and_4[3], a[1], b[3]);
    and(and_4[4], a[0], b[4]);

    FullAdder FA4_1(and_4[0], and_4[1], carry_3[0], sum_4[0], carry_4[0]);
    FullAdder FA4_2(and_4[2], sum_4[0], carry_3[1], sum_4[1], carry_4[1]);
    FullAdder FA4_3(and_4[3], sum_4[1], carry_3[2], sum_4[2], carry_4[2]);
    HalfAdder HA4_1(and_4[4], sum_4[2], product[4], carry_4[3]);

    // p5
    wire [4:0] and_5;
    wire [3:0] carry_5;
    wire [2:0] sum_5;

    and(and_5[0], a[5], b[0]);
    and(and_5[1], a[4], b[1]);
    and(and_5[2], a[3], b[2]);
    and(and_5[3], a[2], b[1]);
    and(and_5[4], a[1], b[0]);

    FullAdder FA5_1(and_5[0], and_5[1], carry_4[0], sum_5[0], carry_5[0]);
    FullAdder FA5_2(and_5[2], sum_5[0], carry_4[1], sum_5[1], carry_5[1]);
    FullAdder FA5_3(and_5[3], sum_5[1], carry_4[2], sum_5[2], carry_5[2]);
    HalfAdder HA5_1(and_5[3], sum_5[2], product[5], carry_5[3]);
    
    // p6
    wire [4:0] and_6;
    wire [3:0] carry_6;
    wire [2:0] sum_6;

    and(and_6[0], a[6], b[0]);
    and(and_6[1], a[5], b[1]);
    and(and_6[2], a[4], b[2]);
    and(and_6[3], a[3], b[3]);
    and(and_6[4], a[2], b[4]);

    FullAdder FA6_1(and_6[0], and_6[1], carry_5[0], sum_6[0], carry_6[0]);
    FullAdder FA6_2(and_6[2], sum_6[0], carry_5[1], sum_6[1], carry_6[1]);
    FullAdder FA6_3(and_6[3], sum_6[1], carry_5[2], sum_6[2], carry_6[2]);
    HalfAdder HA6_1(and_6[3], sum_6[2], product[6], carry_6[3]);
    
    // // p7
    // wire [3:0] and_7;
    // wire [] carry_6;
    // wire [] sum_6;

    // and(and_7[0], a[6], b[1]);
    // and(and_7[1], a[5], b[2]);
    // and(and_7[2], a[4], b[3]);
    // and(and_7[3], a[3], b[4]);

    // FullAdder FA6_1(and_6[0], and_6[1], carry_5[0], sum_6[0], carry_6[0]);
    // FullAdder FA6_2(and_6[2], sum_6[0], carry_5[1], sum_6[1], carry_6[1]);
    // FullAdder FA6_3(and_6[3], sum_6[1], carry_5[2], sum_6[2], carry_6[2]);
    
    // // p8
    // and(, a[6], b[2]);
    // and(, a[5], b[3]);
    // and(, a[4], b[4]);

    // // p9
    // and(, a[6], b[3]);
    // and(, a[5], b[4]);

    
    // // p10 - p11
    // wire 
    // and(, a[6], b[4]);
    // FullAdder FA_(, product[10], product[11]);    
endmodule

module ArrayMultiplier_test;
    reg [6:0] a;
    reg [4:0] b;
    
    wire [11:0] product;
    
    ArrayMultiplier arrayMultiplier(a, b, product);
    
    initial begin
        a = 0;
        b = 0;
       
        #20
        a = 1;
        b = 0;
       
        #20
        a = 5;
        b = 5;

        #20
        a = 35;
        b = 11;
    end
endmodule