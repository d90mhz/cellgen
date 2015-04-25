module invload(in0, out, vdd, gnd);
input in0;
output out;
inout vdd gnd;
assign out = ~(in0);
endmodule

