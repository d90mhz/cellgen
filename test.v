module inv_1(in0, out);
input in0;
output out;
assign out = ~(in0);
endmodule

module nand2_1(in0, in1, out);
input in0, in1;
output out;
assign out = ~(in0 & in1);
endmodule

module nand3_1(in0, in1, in2, out);
input in0, in1, in2;
output out;
assign out = ~(in0 & in1 & in2);
endmodule

module nand4_1(in0, in1, in2, in3, out);
input in0, in1, in2, in3;
output out;
assign out = ~(in0 & in1 & in2 & in3);
endmodule

module nor2_1(in0, in1, out);
input in0, in1;
output out;
assign out = ~(in0 | in1);
endmodule

module nor3_1(in0, in1, in2, out);
input in0, in1, in2;
output out;
assign out = ~(in0 | in1 | in2);
endmodule

module aoi21_1(in0, in1, in2, out);
input in0, in1, in2;
output out;
assign out = ~((in0 & in1) | in2);
endmodule

module aoi22_1(in0, in1, in2, in3, out);
input in0, in1, in2, in3;
output out;
assign out = ~((in0 & in1) | (in2 & in3));
endmodule

module oai21_1(in0, in1, in2, out);
input in0, in1, in2;
output out;
assign out = ~((in0 | in1) & in2);
endmodule

module oai22_1(in0, in1, in2, in3, out);
input in0, in1, in2, in3;
output out;
assign out = ~((in0 | in1) & (in2 | in3));
endmodule

