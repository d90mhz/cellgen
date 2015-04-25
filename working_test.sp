* Synopsys, Inc. 
.OPTIONS SCALE=1.00e+00
.global vdd gnd
.SUBCKT invload out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06 m=3
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-05 m=3
.ENDS
