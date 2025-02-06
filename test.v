module test(phi_inc_i, phi_inc_i1, clk, reset_n, clken, fsin_o, fcos_o, fsin_o2, fcos_o2, fsin_o1, fcos_o1, mul, out_valid, out_valid1, fm_out, out, out_valid2);
  //my top module 
  input [31:0] phi_inc_i,phi_inc_i1; 
  input clk; input reset_n; 
  input clken; output [9:0] fsin_o,fsin_o1; 
  output [9:0] fcos_o,fcos_o1; 
  output [18:0]fcos_o2,fsin_o2; 
  output out_valid,out_valid1,out_valid2; output [18:0]mul,fm_out,out; 
  // input carrier signal of 10 bit 
  signal  a1( .phi_inc_i(phi_inc_i),
     .clk(clk),
     .reset_n(reset_n),
     .clken(clken),
     .fsin_o(fsin_o),
     .fcos_o(fcos_o),
     .out_valid(out_valid));
// input message signal of 10 bit 
  signal a2( .phi_inc_i(phi_inc_i1), .clk(clk),
     .reset_n(reset_n), 
     .clken(clken), 
     .fsin_o(fsin_o1), 
     .fcos_o(fcos_o1),
     .out_valid(out_valid1));
// to get carrier signal output of 19 bit we generate this module 
  cos19 a3( .phi_inc_i(phi_inc_i), 
           .clk(clk), 
           .reset_n(reset_n), 
           .clken(clken), 
           .fsin_o(fsin_o2),
           .fcos_o(fcos_o2), 
           .out_valid(out_valid2));
  assign mul=fsin_o*fsin_o1; 
  assign out=fcos_o2[18:0]-mul[18:0];
  // here we ingonre msb(signed 1 bit) for fm_out
  assign fm_out=~out; 
endmodule
