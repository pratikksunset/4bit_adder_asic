// Code your design here
module f_add(
    input  a,
    input  b,
    input cin,
    output sum,
    output cout
    );
    
    assign sum = a ^ b ^ cin;
    assign cout  = (a & b) | (cin & (a^b)); 
   
endmodule

module four_bit_add(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [4:0] sum
    );
    
    wire [2:0]w;
   
    
    f_add f1 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(w[0]));
    f_add f2 (.a(a[1]),.b(b[1]),.cin(w[0]),.sum(sum[1]),.cout(w[1]));
    f_add f3 (.a(a[2]),.b(b[2]),.cin(w[1]),.sum(sum[2]),.cout(w[2]));
    f_add f4 (.a(a[3]),.b(b[3]),.cin(w[2]),.sum(sum[3]),.cout(sum[4]));
    
endmodule