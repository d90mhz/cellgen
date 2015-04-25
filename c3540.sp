* Synopsys, Inc. 
*epic tech="voltage 1.8" 

.lib '~/research/lib/model018ls.lib' TT 
.temp 25 
.option post CONVERGE=1 GMINDC=1.0000E-12 
vdd vdd gnd 1.8 
.tran 0.01n 2000n 
.OPTIONS SCALE=1.00e+00
.global vdd gnd
.SUBCKT invload out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06 m=3
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06 m=3
.ENDS
.SUBCKT inv1x_1 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_2 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_3 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_1 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand2_2 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_3 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand2_4 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_1 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_1 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT oai21_2 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_5 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_2 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT inv1x_4 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_5 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT inv1x_6 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_7 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nand3_1 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand3_2 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand3_3 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_8 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT nand3_4 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_9 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand2_6 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT xor2_1 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=3.5e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.8e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT xor2_2 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.8e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.8e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand3_5 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_7 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT inv1x_10 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT xor2_3 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1.4e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_3 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand3_6 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=6e-07
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT aoi22_1 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 intb gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1e-06
mxn3  intb in3 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp3  out in3 intm vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT oai21_4 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand2_8 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_1 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_11 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_4 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_5 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=1.4e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_9 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT xor2_6 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.8e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_5 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_12 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_6 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT oai22_1 out in0 in1 in2 in3
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intn vdd  pmos4 l=2e-07 w=1e-06
mxn3  out in3 inta gnd  nmos4 l=2e-07 w=6e-07
mxp3  intn in3 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand4_1 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=6e-07
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand3_7 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.8e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand4_2 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_13 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=8.4e-06
.ENDS
.SUBCKT inv1x_14 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT xor2_7 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand3_8 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_8 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.9e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=4.2e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT xor2_9 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=5.6e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=4.2e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=5.6e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=5.6e-06
.ENDS
.SUBCKT xor2_10 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.9e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=4.2e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT xor2_11 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.9e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=4.2e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT xor2_12 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1.4e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_13 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.8e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.1e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT xor2_14 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.2e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=3.5e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT nor3_1 out in0 in1 in2
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 intn vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  intn in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor3_2 out in0 in1 in2
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 intn vdd  pmos4 l=2e-07 w=1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  intn in2 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT xor2_15 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.9e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=3.5e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT nand2_10 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT inv1x_15 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT oai21_7 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_2 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand4_3 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT inv1x_16 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT oai21_8 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_9 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT xor2_16 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=1.4e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=6e-07
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=6e-07
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1.4e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand3_9 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_3 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_3 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nand3_10 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nor2_4 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_17 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.1e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=1.4e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT xor2_18 out in0 in1
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=3.5e-06
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.1e-06
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT inv1x_17 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT nand4_4 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1e-06
.ENDS
.SUBCKT nand3_11 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT oai22_2 out in0 in1 in2 in3
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intn vdd  pmos4 l=2e-07 w=2.1e-06
mxn3  out in3 inta gnd  nmos4 l=2e-07 w=1e-06
mxp3  intn in3 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_4 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_5 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nor2_5 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT aoi22_2 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 intb gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  intb in3 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp3  out in3 intm vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_6 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nor2_7 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand3_12 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=6e-07
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=6e-07
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=6e-07
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand3_13 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand4_5 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_11 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT oai21_10 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand2_12 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
Xld0 prout0 n353_405  invload
Xld1 prout1 n355_399  invload
Xld2 prout2 n361_940  invload
Xld3 prout3 n358_1161  invload
Xld4 prout4 n351_1247  invload
Xld5 prout5 n372_1243  invload
Xld6 prout6 n369_1321  invload
Xld7 prout7 n399_1428  invload
Xld8 prout8 n364_1484  invload
Xld9 prout9 n396_1504  invload
Xld10 prout10 n384_1553  invload
Xld11 prout11 n367_1585  invload
Xld12 prout12 n387_1616  invload
Xld13 prout13 n393_1605  invload
Xld14 prout14 n390_1603  invload
Xld15 prout15 n378_1597  invload
Xld16 prout16 n375_1624  invload
Xld17 prout17 n381_1626  invload
Xld18 prout18 n407_1657  invload
Xld19 prout19 n409_1670  invload
Xld20 prout20 n405_1717  invload
Xld21 prout21 n402_1718  invload
Xg1 n971 net1786  inv1x_1
Xg2 n972 net2893  inv1x_1
Xg3 n973 n200_25  inv1x_1
Xg4 n974 n973  inv1x_1
Xg5 n975 net1692  inv1x_2
Xg6 n977 n1112  inv1x_1
Xg7 n976 n1112  inv1x_1
Xg8 n979 n1128  inv1x_1
Xg9 n978 n1128  inv1x_3
Xg10 n980 n87_10  inv1x_1
Xg11 n981 n980  inv1x_1
Xg12 n982 n980  inv1x_1
Xg13 n983 n980  inv1x_1
Xg14 n984 n980  inv1x_1
Xg15 n985 n68_8  inv1x_1
Xg16 n986 n985  inv1x_1
Xg17 n987 n985  inv1x_1
Xg18 n988 n985  inv1x_1
Xg19 n990 net2792 n1519  nand2_1
Xg20 n989 net2792 n1519  nand2_1
Xg21 net1856 net2283 net1858  nand2_2
Xg22 net2541 net1856  inv1x_3
Xg23 net2283 net2553 net1656  nand2_3
Xg24 net2943 net2283 net1858  nand2_4
Xg25 net2553 net1769 net1839 n997  oai21_1
Xg26 n997 n270_36 net1839  nand2_1
Xg27 net1769 n274_37  inv1x_2
Xg28 net2033 net2866 net1769  nor2_1
Xg29 net1951 net1769 net1783 net1952  oai21_2
Xg30 net1858 net2460 n991  nand2_5
Xg31 n991 n992 n993  nor2_2
Xg32 n993 n996  inv1x_1
Xg33 n996 net2940 n33_3  nand2_1
Xg34 net2939 n41_4  inv1x_4
Xg35 net2940 net2939  inv1x_5
Xg36 n992 n13_1 net2662  nand2_1
Xg37 net2662 net2661  inv1x_2
Xg38 net2924 net2662  inv1x_6
Xg39 net2661 n1_0  inv1x_7
Xg40 net1839 net2661 net1771 n45_5  nand3_1
Xg41 net2664 net2661  inv1x_5
Xg42 net2460 net2461 n994 n995  nand3_2
Xg43 n995 n303_40 n33_3  nand2_1
Xg44 n994 n257_34 net2741 net1773  nand3_3
Xg45 net1773 n1698_48  inv1x_8
Xg46 net2741 n33_3  inv1x_5
Xg47 net2461 n264_35 net2741 n1698_48  nand3_4
Xg48 net1843 n257_34 net2841 net1656  nand3_4
Xg49 net1967 net1656  inv1x_9
Xg50 net2953 net1563 net1564  nand2_6
Xg51 net2245 n393_1605 net2953  xor2_1
Xg52 net1563 net2945  inv1x_9
Xg53 n390_1603 net1563 net2955  nand2_1
Xg54 net2945 net2187 net2500  nand2_5
Xg55 net1564 net1926 net1940  nand2_3
Xg56 net2954 net1564  inv1x_1
Xg57 net1940 net1941 net2880  xor2_2
Xg58 net2880 n999 net1912 net1913  nand3_3
Xg59 n999 n998  inv1x_1
Xg60 net1910 n999 net1912 net1913  nand3_5
Xg61 n998 net1673 net1640  nor2_1
Xg62 net1941 net1741 net1904  nand2_7
Xg63 net1741 net2733  inv1x_10
Xg64 net2123 net1741 net1633  nor2_1
Xg65 net1991 net1741  inv1x_1
Xg66 net2733 net2944 net2902  xor2_3
Xg67 net2944 net1859 net2185 net2480  oai21_1
Xg68 net1859 n330_46  inv1x_1
Xg69 net1926 net1633  inv1x_1
Xg70 net2187 net2167 net2496 n1003  nand3_3
Xg71 net2186 net2187 net2955  nand2_1
Xg72 n1003 net1687 n1002  nor2_2
Xg73 n1002 net2154 n1001 net1996  oai21_3
Xg74 n1001 net2081 net2158 n1000  nand3_6
Xg75 n1000 n159_21 n975 net2695 n150_20  aoi22_1
Xg76 net2695 net1884  inv1x_3
Xg77 net2694 net1884  inv1x_1
Xg78 net2696 net1884  inv1x_1
Xg79 net1904 n1004 net2830  nand2_7
Xg80 net1946 net1613 net1904 net1614  oai21_4
Xg81 net1903 net1904 net1905  nand2_8
Xg82 net1990 net1894 net1904 net1991  aoi21_1
Xg83 net2830 net1669  inv1x_11
Xg84 net1669 net1629  inv1x_9
Xg85 net2829 net1669  inv1x_6
Xg86 n1004 net2468 net2037  nand2_7
Xg87 net2902 net1739 net1740  xor2_4
Xg88 net2138 net2902 net2121 net1674  aoi21_1
Xg89 net1740 net1959 net1852 net1672  oai21_1
Xg90 net1739 net2478  inv1x_3
Xg91 net1738 net1739 net2967  xor2_5
Xg92 net2478 net1669 net1852  nand2_9
Xg93 net2185 net2818 net2814  xor2_6
Xg94 net2324 net2185  inv1x_1
Xg95 net2482 net1859 net2185 net2480  oai21_5
Xg96 net2814 net2323  inv1x_1
Xg97 net2323 net2825 net2286  nand2_1
Xg98 net2825 net1629  inv1x_1
Xg99 net1912 n1005 net1641  nand2_4
Xg100 net2490 net2488 net2882 net1912  nand3_6
Xg101 n1005 n1006  inv1x_11
Xg102 n1006 net1673 net1640  nand2_5
Xg103 net1913 net2484 net2482 net2095  nand3_2
Xg104 net2486 net2097 net1913  nand2_1
Xg105 net2095 net1673  inv1x_12
Xg106 net2858 net2095  inv1x_3
Xg107 net2484 net1738  inv1x_6
Xg108 net1641 net2484 net2482  nand2_4
Xg109 net2967 net1959 net1852 net2968  oai21_4
Xg110 net1978 net2837 net2595  nand2_5
Xg111 net2818 net2837 net1961 net1978  oai21_6
Xg112 net1976 net2931 net1961 net1978  oai21_3
Xg113 net2595 n200_25 net2541 n190_24 net2943  oai22_1
Xg114 net1963 net2541 net1813  nand2_1
Xg115 net2837 net2286  inv1x_9
Xg116 net2930 net2837  inv1x_2
Xg117 net2542 net1951 net2943 net1849 net2845  nand4_1
Xg118 net1962 net2943  inv1x_12
Xg119 net1656 net2663 n13_1 net1778  nand3_7
Xg120 net2663 net2849  inv1x_5
Xg121 net2537 net2663 net1765  nand2_1
Xg122 net2450 net2663 n13_1 net2545  nand3_4
Xg123 net2423 net2424 net2425 net2663 net2007  nand4_2
Xg124 net2849 n1_0  inv1x_13
Xg125 net2340 net1839  inv1x_14
Xg126 net1771 n41_4  inv1x_8
Xg127 net2861 net1771  inv1x_7
Xg128 net2262 n257_34 n972 n270_36 net2639  aoi22_1
Xg129 net2115 n270_36 n257_34  xor2_7
Xg130 net1845 net2340 n274_37  nand2_7
Xg131 net2783 net2867 n13_1 net1778  nand3_8
Xg132 net2480 net2481 net2830 net2930  nand3_4
Xg133 net2931 net2930  inv1x_10
Xg134 net2481 net1961  inv1x_2
Xg135 net2961 net2481  inv1x_3
Xg136 net2197 n330_46 net2198 net2196  nand3_5
Xg137 net2254 net2255 net2252  xor2_8
Xg138 n402_1718 net2254 net2325  xor2_9
Xg139 net2252 net2574  inv1x_13
Xg140 net1746 net2251 net2252  xor2_10
Xg141 net2574 net2246 net2575  xor2_11
Xg142 net2575 n1009 n387_1616  xor2_12
Xg143 n1009 n1010 net1296  xor2_13
Xg144 n1010 n1008  inv1x_1
Xg145 n1008 n396_1504  inv1x_1
Xg146 net2243 n1008 net1609  nand2_1
Xg147 net2246 net2247 net2245  xor2_14
Xg148 net2247 net5695  inv1x_14
Xg149 net2255 n378_1597  inv1x_1
Xg150 n387_1616 net1893 net1985 n1007  oai21_4
Xg151 net1622 net2243 n387_1616 net2240  nor3_1
Xg152 net2235 net2193 n387_1616 net2192 n381_1626  aoi22_1
Xg153 n1007 net2565 net2492 net1893  nand3_6
Xg154 net2492 net1894 net2490 net1939  nand3_6
Xg155 net1939 net1903  inv1x_1
Xg156 net2959 net1939  inv1x_1
Xg157 net1625 net2123 net1939  nand2_1
Xg158 net2882 net1991  inv1x_1
Xg159 n393_1605 n1011 net1625  nand2_1
Xg160 net1621 net5695 n390_1603 n393_1605  nor3_2
Xg161 net2188 n393_1605 net2186  nor2_1
Xg162 n1011 net1990 net1893 n1014  aoi21_1
Xg163 n1014 n1015  inv1x_1
Xg164 n1015 net2139 net2138 net1993  nand3_6
Xg165 net1993 net1893  inv1x_11
Xg166 net1674 net1675 n1012  nor2_1
Xg167 n1012 net2090 net2128 n1013  nand3_6
Xg168 n1013 n317_42 net2078 n322_43 net2696  aoi22_1
Xg169 n405_1717 net1746 net1747  xor2_15
Xg170 net2251 net2532  inv1x_12
Xg171 net2532 net2316 n1021  nand2_10
Xg172 n1021 net1633 net2002 net1609  oai21_1
Xg173 net1609 net1927  inv1x_15
Xg174 net1730 net1609 net1731  nor2_1
Xg175 n378_1597 net1609 net1610  nand2_1
Xg176 net1927 net1894 net1928 n1016  oai21_1
Xg177 n1016 net2234 n1020  nand2_1
Xg178 n1020 net1702 n1019  nor2_1
Xg179 n1019 net2227 net2230 net2220 n1018  oai22_1
Xg180 n1018 net2090 net2224 n1017  nand3_6
Xg181 n1017 n975 net2639 net2696 n283_38  aoi22_1
Xg182 net1905 n330_46 net2816  nand2_9
Xg183 net2827 net1629  inv1x_2
Xg184 net1961 n169_22 net1962 net1963  oai21_7
Xg185 net1813 n179_23  inv1x_3
Xg186 net2539 net2540 net1962 net2451 net2278  nand4_1
Xg187 net2286 net2017 n1023 n1027  oai21_7
Xg188 n1027 n1025 net2638 n1026  aoi21_2
Xg189 n1026 net2638 net2263  nor2_2
Xg190 net2638 net2637  inv1x_11
Xg191 net2637 n116_13  inv1x_9
Xg192 net2639 net2637  inv1x_11
Xg193 net2640 net2637  inv1x_5
Xg194 n1025 n1022  inv1x_5
Xg195 net2928 n1025  inv1x_11
Xg196 n1022 net2273 net2263 net2267 net2016  nand4_3
Xg197 n1023 net2911 n1024  nand2_9
Xg198 n1024 net2008 net1799  nand2_1
Xg199 net1799 n97_11  inv1x_15
Xg200 net2425 net2740 net1799 net2669  nand3_6
Xg201 net1747 net2530 n1034 n1036  oai21_1
Xg202 n1036 net2530 n1035  nand2_1
Xg203 n1035 n2897_49  inv1x_1
Xg204 net2530 net2316  inv1x_1
Xg205 n1034 n1028 n1033 net2318  oai21_4
Xg206 n1033 net1744 net1893  nand2_1
Xg207 n1028 n1029 net2846 n1037  aoi21_1
Xg208 n1037 n1030 n1031 net1894  oai21_4
Xg209 net1894 net1865  inv1x_1
Xg210 n1031 net2335  inv1x_1
Xg211 n1030 net1825  inv1x_1
Xg212 net2949 n1030  inv1x_1
Xg213 n1029 n1032 net2936  nor2_1
Xg214 n1032 net2900 net2048  nand2_1
Xg215 net2325 n1044 n1040 net2522  oai21_1
Xg216 n1040 net1926 net1744  nand2_1
Xg217 n1044 n1043  inv1x_16
Xg218 net2525 n1044 net2526 net2522  oai21_8
Xg219 n1043 n1041 n1042  nand2_1
Xg220 n1042 n1039 net2891  nand2_1
Xg221 n1039 n1038 net2936  nor2_1
Xg222 n1038 net2901 net2048  nand2_1
Xg223 n1041 net1864  inv1x_1
Xg224 net2522 net2516 net1744 net2523  oai21_9
Xg225 net2528 net2522 net1633  nand2_5
Xg226 net1838 net1799 net1810 net1604  oai21_2
Xg227 net1604 net1810 net1799  nand2_7
Xg228 net2008 net1762  inv1x_14
Xg229 net2911 net1763  inv1x_3
Xg230 net2017 net2640 net2669 n283_38 net1761  oai22_1
Xg231 net2968 n1225 n1226 net1852  nand3_5
Xg232 n1045 n1306 n1307  nor2_2
Xg233 n1046 n1255 net2783 n1256  oai21_4
Xg234 net2963 net2928  inv1x_1
Xg235 n1047 n1242 n1243 n1045  nand3_2
Xg236 net2955 net2954  inv1x_1
Xg237 n1048 net2949 net2335 net2948  aoi21_1
Xg238 n1145 n1048  inv1x_1
Xg239 net2948 net1894  inv1x_1
Xg240 n1049 n1086 n1257 net1967  oai21_4
Xg241 net2936 n1273 n1274  nand2_9
Xg242 net2925 net2924  inv1x_2
Xg243 net2920 n107_12  inv1x_3
Xg244 net2921 net2920  inv1x_15
Xg245 n1050 n1269 n1270 n1271  oai21_4
Xg246 n1051 n1269 n1270 n1271  oai21_2
Xg247 net2908 net2861  inv1x_15
Xg248 net2901 n1309 n1062  nand2_7
Xg249 net2900 n1309 n1062  nand2_7
Xg250 n1052 n1119 net2891 n1287  oai21_4
Xg251 n1246 net1903 n1053  xor2_12
Xg252 n1053 n1060  inv1x_11
Xg253 net2893 n97_11  inv1x_3
Xg254 net2894 net2893  inv1x_11
Xg255 n1054 net1765 n1520  nand2_4
Xg256 net2891 net2198 n1504  xor2_16
Xg257 n1055 net2936 n1315 n1333  oai21_4
Xg258 n1056 net1762 n1057 n1054  oai21_4
Xg259 n1292 n1056  inv1x_3
Xg260 n1057 n1158  inv1x_3
Xg261 n1058 n1073 n1146  xor2_16
Xg262 n1059 n1605 net2874 n1606  nand3_3
Xg263 n1309 n1059  inv1x_15
Xg264 net2874 net1859  inv1x_1
Xg265 n1060 n1058  inv1x_11
Xg266 net2867 net2849  inv1x_14
Xg267 net2866 net2849  inv1x_14
Xg268 n381_1626 n1069 n1070 n1055  nand3_6
Xg269 net2847 net2821  inv1x_11
Xg270 net2846 net2198 n1504  xor2_16
Xg271 net2845 net1843 n1049 net1845  nand3_9
Xg272 net2841 net2340  inv1x_12
Xg273 net2821 net2263  inv1x_9
Xg274 net2822 net2821  inv1x_16
Xg275 net2819 net2324  inv1x_1
Xg276 net2816 net2830 n1075 n1477  aoi21_2
Xg277 n1061 net2830 n1047 n1477  aoi21_1
Xg278 n1062 net2830 n1047 n1477  aoi21_3
Xg279 n1272 n1062  inv1x_3
Xg280 net2808 net1765  inv1x_1
Xg281 net2784 net2671  inv1x_12
Xg282 net2785 net2671  inv1x_3
Xg283 net2787 net2794  inv1x_1
Xg284 net2788 net2784  inv1x_3
Xg285 net2790 net2784  inv1x_1
Xg286 net2791 net2784  inv1x_3
Xg287 net2792 net2785  inv1x_1
Xg288 net2793 net2785  inv1x_1
Xg289 net2794 n20_2  inv1x_11
Xg290 net2779 net1296  inv1x_1
Xg291 n384_1553 net2779  inv1x_1
Xg292 net2736 net2701  inv1x_12
Xg293 net2738 net1755  inv1x_1
Xg294 net2740 net2749  inv1x_1
Xg295 net2742 n33_3  inv1x_9
Xg296 net2743 net2701  inv1x_11
Xg297 net2744 net2742  inv1x_3
Xg298 net2746 net2741  inv1x_9
Xg299 net2747 net2736  inv1x_1
Xg300 net2749 net2744  inv1x_3
Xg301 n367_1585 n1063 n1064 n1065  nand3_6
Xg302 n375_1624 net1601 net1602  nor2_3
Xg303 n355_399 n984 net1604  nand2_1
Xg304 n353_405 n1066 n1067  nor2_1
Xg305 n369_1321 n1068 net1613 net1614  oai21_4
Xg306 net5695 n1069 n1070 n1071  nand3_10
Xg307 n407_1657 n1072 net1621 net1622  nand3_3
Xg308 n1073 n1074 net2829  nor2_4
Xg309 n372_1243 net1613 n1047  nor2_1
Xg310 n364_1484 net1633 n1076 n1077  oai21_4
Xg311 n399_1428 net1640 net1641  nand2_1
Xg312 n1078 n988 n1079  nor2_1
Xg313 n1080 n1081 n1082 net2783  aoi21_1
Xg314 n1083 n1084 n1085 net2783  aoi21_2
Xg315 n1086 n1087 n1088  nor2_2
Xg316 n1089 n1090 net2830  nor2_1
Xg317 n1091 n1092 n1093  nor2_1
Xg318 n1094 net2827 n1095  nor2_1
Xg319 net1671 net2968 net2858  nor2_1
Xg320 n1096 n1097 n1098  nor2_1
Xg321 n1099 n1100 n1101  nor2_1
Xg322 n1102 n1103 n1104  nor2_1
Xg323 n1105 n1603 n1079  nor2_1
Xg324 net1687 n1106 n1107  nor2_1
Xg325 n1108 n1109 net1692  nor2_1
Xg326 n1110 n1111 n1112  nor2_1
Xg327 n1113 n1114 n1115  nor2_1
Xg328 n1116 n1117 n1118  nor2_1
Xg329 net1702 n1600 n1079  nor2_1
Xg330 n1119 net2936 n1121  nor2_2
Xg331 n1122 n1123 n1118  nor2_1
Xg332 n1124 n1125 n1126  nor2_1
Xg333 n1127 n1128 n1129  nor2_1
Xg334 n1130 n1131 net1692  nor2_1
Xg335 n1132 n1109 n1133  nor2_1
Xg336 n1134 n1597 n1079  nor2_1
Xg337 n1135 n1136 n1137  nor2_1
Xg338 n1138 n1139 n1140  nor2_3
Xg339 n1141 net1726 n1053 n1051  nor3_2
Xg340 n1144 net2858 net1640  nor2_1
Xg341 n1142 n1073 n1146  xor2_16
Xg342 net1726 n1116 n1147  xor2_17
Xg343 net1744 n1138 n1148  xor2_18
Xg344 n1149 n1596 n1150  nor2_1
Xg345 n1151 n1141 net1613  xor2_7
Xg346 n358_1161 n1152 n1153  xor2_7
Xg347 n351_1247 n1154 n1155  xor2_7
Xg348 net1755 net2736  inv1x_1
Xg349 net1759 net2866  inv1x_8
Xg350 n1066 n1109 n1150  nand2_9
Xg351 net1761 net2746 net2794  nand2_7
Xg352 net1762 net2794 net2701  nand2_5
Xg353 net1763 net2925 n1156  nand2_9
Xg354 net1765 n13_1  inv1x_17
Xg355 n1157 n1595  inv1x_10
Xg356 n1087 net1773 net2741  nand2_1
Xg357 n1158 n77_9  inv1x_10
Xg358 n1159 n1698_48 net2742  nand2_1
Xg359 net1779 n45_5  inv1x_3
Xg360 n1160 n1161 net1783 net2783  nand3_4
Xg361 n1162 n226_29  inv1x_1
Xg362 net1786 n190_24  inv1x_1
Xg363 net1788 n200_25  inv1x_1
Xg364 n1163 n1164 n1165 n1166  nand3_4
Xg365 n1109 n58_7  inv1x_3
Xg366 n1150 n68_8  inv1x_2
Xg367 n1111 n87_10  inv1x_3
Xg368 n1167 n232_30  inv1x_1
Xg369 n1168 n1169 n1170 n1171  nand3_5
Xg370 n1172 n1173 n1174 n1175  nand3_6
Xg371 n1088 n244_32  inv1x_1
Xg372 net1810 n107_12  inv1x_15
Xg373 n1147 n1137 n1176  nand2_7
Xg374 net1815 n169_22  inv1x_1
Xg375 n1177 n1178 n1179 n1180  nand3_6
Xg376 n1146 n1181 n1182  nand2_4
Xg377 n1183 n1184 net1825  nand2_7
Xg378 n1185 n1186 n1187 n1188  oai21_1
Xg379 net1613 n1189 n1190 n1191 n1192  nand4_2
Xg380 n1193 net2791 net1765 net2867  nand3_5
Xg381 net1731 n213_26  inv1x_1
Xg382 n1118 n213_26 n13_1 net1759 net2669  nand4_4
Xg383 n1194 n343_47  inv1x_1
Xg384 net1840 n283_38  inv1x_1
Xg385 net1842 net1843 n1195 net1845  nand3_4
Xg386 n1196 n1197 n1198  nand2_8
Xg387 net1849 n1199 net1845 n1200  nand3_10
Xg388 net1852 n1201 n1202 n1203  nand3_11
Xg389 net1629 n343_47 n1136  nand2_5
Xg390 n1181 n1204 n1205 n1177  nand3_2
Xg391 net1633 n1206 net2908  nand2_8
Xg392 net1864 net1613 net1614  nand2_5
Xg393 net1865 net2925 n1207  nand2_1
Xg394 n1208 n169_22 net2784 n13_1  oai21_4
Xg395 n1209 net2788 net1813  nand2_1
Xg396 n1133 n1210 n1211  nand2_1
Xg397 n1125 n1212 n1211  nand2_9
Xg398 n1131 n128_16  inv1x_1
Xg399 n1213 n179_23 net2788  nand2_9
Xg400 n1214 n1215 n1216  nand2_1
Xg401 n1217 n143_19  inv1x_1
Xg402 n1128 n1212 n1216  nand2_9
Xg403 net1880 n150_20  inv1x_1
Xg404 net1692 n1218 n1216  nand2_9
Xg405 n1129 n137_18  inv1x_1
Xg406 net1884 n1219 n1216  nand2_9
Xg407 n1112 n1220 n1211  nand2_1
Xg408 net1887 n159_21  inv1x_1
Xg409 net1889 n1221 net2749  nand2_1
Xg410 net1891 n1221 net2738  nand2_1
Xg411 n1079 n1222 n1208  nand2_1
Xg412 n1222 net1765 net1755  nand2_1
Xg413 net1893 net1894 net1633  nand2_5
Xg414 n1092 net1895 n1208  nand2_1
Xg415 net1895 n1223 net2785  nand2_1
Xg416 n1095 n1224 n1196  nand2_5
Xg417 net1672 n1225 n1226 net1852  nand3_2
Xg418 net1673 n1227 n1228 n1229  nand3_2
Xg419 net1640 net1906 net2830  nand2_2
Xg420 n1230 n1231 net1909  nand2_1
Xg421 n1076 n1597 n1066  nand2_1
Xg422 n1232 n1233 n1234 net2830  oai21_4
Xg423 n1137 n1235 n1236 n1172  nand3_2
Xg424 n1237 n1238 n1239 n1060 n1240  nand4_2
Xg425 n1126 n124_14  inv1x_1
Xg426 net1610 n1241 net1926  nand2_2
Xg427 n1075 n1242 n1243 n1244  nand3_4
Xg428 n1245 net2808 net2793 net2664  nand3_6
Xg429 n1247 n1596 n58_7  xor2_7
Xg430 n1248 n1595 n1599  xor2_7
Xg431 n1249 n1602 n987  xor2_7
Xg432 n1250 net1946 n1251  xor2_7
Xg433 n1252 n1111 net2928 n1253  oai21_1
Xg434 n1254 n1255 net2783 n1256  oai21_7
Xg435 n1257 net2742 net1840 net2743 n1258  oai22_1
Xg436 n1259 net2640 net2742  nor2_2
Xg437 net1959 net1786 net1849 n1260  oai21_2
Xg438 n1261 n179_23 net2845 n1262  oai21_2
Xg439 n1263 net1967 n1264 n1265  oai21_4
Xg440 n1187 n179_23 n1266 n1267  oai21_4
Xg441 n1268 n1603 net1755  nor2_1
Xg442 n1143 n1269 n1270 n1271  oai21_3
Xg443 n1120 n1273 n1274  nand2_8
Xg444 n1093 n1193 n1152 n1275  oai21_4
Xg445 n1276 n1277 n1278  nand2_1
Xg446 net1296 net1893 n1279 net1993 n1246  oai22_2
Xg447 n1280 n1281 net1996 n1282  oai21_4
Xg448 n396_1504 net1993 n1283 n1284  oai21_4
Xg449 n1285 net2936 n1286  nor2_1
Xg450 net2002 n1119 net2891 n1287  oai21_4
Xg451 n1288 n1600 n1289 n1290  oai21_4
Xg452 net2007 net2008 n1150 n1291  aoi21_1
Xg453 n1293 net2008 n1111 n1291  aoi21_4
Xg454 n1294 net2013 net2014  nor2_2
Xg455 n1295 net2861 net2746 net2016  aoi21_5
Xg456 net2016 n13_1 net2664  nand2_4
Xg457 n1296 net2931 net2961  nor2_2
Xg458 n1297 n1224 n1196 net1906  aoi21_2
Xg459 n1298 n1299 n1300  nor2_5
Xg460 n1301 net2008 n1109 n1291  aoi21_1
Xg461 n1302 net2031 n1111 n1303  aoi21_2
Xg462 n1303 n1602 net2669 net2867  oai21_4
Xg463 n1304 net2008 n1157 n1291  aoi21_2
Xg464 n1305 net2827 n1050  nor2_1
Xg465 n1306 n1229 net2037  nand2_5
Xg466 n1307 n1308 net2968  nand2_10
Xg467 n1244 n1306 n1307  nor2_2
Xg468 n1242 n1224 n1196 net1976  aoi21_2
Xg469 n1310 n1142 net1859  nor2_1
Xg470 n1311 net2827 n1058  nor2_1
Xg471 n1312 n1311 n1313 n1314  aoi21_1
Xg472 n1315 net2900 net2048  nand2_10
Xg473 n1317 n1597 net2785  nor2_2
Xg474 n1318 n1317 n1319 net2031 n1109  aoi22_2
Xg475 n1081 n222_27 n1320 n1321  aoi21_1
Xg476 n1322 n1323 n1080  nor2_2
Xg477 n1324 net2031 n1150 net2008 net1887  aoi22_1
Xg478 n1084 n223_28 n1320 n1325  aoi21_1
Xg479 n1326 n1323 n1083  nor2_2
Xg480 n1327 n1181 n1328 n1329  aoi21_2
Xg481 n1330 n1331 n1163 n1332  aoi21_1
Xg482 n1333 net1864 net1633  nor2_6
Xg483 n1334 n1145 net2048  nand2_10
Xg484 n1335 net2068 n1334  nor2_7
Xg485 n1210 n190_24 net1788  nor2_1
Xg486 n1212 n200_25 n190_24  nor2_1
Xg487 n1215 n190_24 net1788  nor2_1
Xg488 n1218 n974 net1786  nor2_1
Xg489 n1219 net1786 net1788  nor2_1
Xg490 n1220 net1786 net1788  nor2_1
Xg491 n1336 n1596 n990 n1609 n1599  aoi22_1
Xg492 n1338 n143_19 n1612 n150_20 n979  aoi22_1
Xg493 n1340 n1336 n1341 n1338  nand3_6
Xg494 n1342 n137_18 net2078 n132_17 net2694  aoi22_1
Xg495 n1343 net2081 n1344 n1342  nand3_6
Xg496 n1345 n975 n283_38 net2694 n294_39  aoi22_1
Xg497 n1346 n1347 n1348 n1349 n1345  nand4_1
Xg498 n1350 n978 net2921 n1614 net2640  aoi22_1
Xg499 n1351 net2090 n1352 n1350  nand3_6
Xg500 n1353 n1346 n1351 n1340 n1343  oai22_1
Xg501 n1354 n1078 n1353  nor2_1
Xg502 net2097 n1094 n1144  nor2_1
Xg503 n1355 n988 n989 n976 n1599  aoi22_1
Xg504 n1357 n1611 n1602 n159_21 n1613  aoi22_1
Xg505 n1358 n1355 n1359 n1357  nand3_6
Xg506 n1360 net2081 n1361 n1362 n1363  nand4_1
Xg507 n1364 net2921 n1337 n317_42 n1607  aoi22_1
Xg508 n1366 n1613 n294_39 n978 n283_38  aoi22_1
Xg509 n1367 n1364 n1368 n1366  nand3_6
Xg510 n1369 net2078 n303_40 n311_41 net2695  aoi22_1
Xg511 n1370 net2090 n1371 n1369  nand3_6
Xg512 n1372 n250_33 n264_35  xor2_7
Xg513 n1373 n1367 n1370 n1358 n1360  oai22_1
Xg514 n1374 net2119 n1373  nor2_1
Xg515 n1375 net2121 n1376 n1091  aoi21_1
Xg516 n1377 n283_38 n1337 n326_44 n1608  aoi22_1
Xg517 n1378 n311_41 n1614 n1339 n303_40  aoi22_1
Xg518 net1675 n1377 n1379 n1378  nand3_6
Xg519 n1380 n983 n989 n150_20 n1608  aoi22_1
Xg520 n1381 n1611 net2894 n978 n988  aoi22_1
Xg521 n1097 n1380 n1382 n1381  nand3_6
Xg522 n1383 n975 n1595 n159_21 net2696  aoi22_1
Xg523 n1098 net2081 n1384 n1383  nand3_6
Xg524 n1231 net2640 n981  nor2_1
Xg525 n1385 n1597 n1386  nor2_1
Xg526 n1387 n232_30 n244_32  xor2_7
Xg527 n1388 n238_31 n226_29  xor2_7
Xg528 net2139 n1096 n1276  nor2_1
Xg529 n1389 n1600 n989 n132_17 n1607  aoi22_1
Xg530 n1390 n150_20 n1612 n159_21 n1339  aoi22_1
Xg531 n1100 n1389 n1391 n1390  nand3_6
Xg532 n1392 net2078 n143_19 net2695 n137_18  aoi22_1
Xg533 n1101 net2081 n1393 n1392  nand3_6
Xg534 n1394 net2894 n1337 n311_41 n1365  aoi22_1
Xg535 n1395 n1612 n283_38 n979 net2640  aoi22_1
Xg536 n1103 n1394 n1396 n1395  nand3_6
Xg537 n1397 n975 n294_39 net2694 n303_40  aoi22_1
Xg538 n1104 net2090 n1398 n1397  nand3_6
Xg539 n1399 n1099 n1102  nor2_1
Xg540 n1400 n1053 n1223 n1105  aoi21_2
Xg541 n1401 n1603 n990 n143_19 n1607  aoi22_1
Xg542 n1402 n1609 n984 n1613 n1597  aoi22_1
Xg543 net2154 n1401 n1403 n1402  nand3_12
Xg544 n1404 net2640 n989 n322_43 n1608  aoi22_1
Xg545 n1405 n1614 n303_40 n1339 n294_39  aoi22_1
Xg546 n1106 n1404 n1406 n1405  nand3_6
Xg547 n1407 n311_41 n975 n976 n283_38  aoi22_1
Xg548 n1107 net2090 n1408 n1407  nand3_6
Xg549 n1409 net2639 n982  xor2_7
Xg550 net2167 n1410 n1411 net1893  aoi21_2
Xg551 n1412 n1125 net1887 n1413  oai21_4
Xg552 n1414 n1150 n1214 net1810 n1133  oai22_1
Xg553 n1415 n1414 n1108 n1412  nor3_2
Xg554 n1416 n1158 n1128 n1417  oai21_4
Xg555 n1418 n1416 n1110 net1889  nor3_2
Xg556 n1419 n317_42 n1612 n311_41 n979  aoi22_1
Xg557 n1114 n1420 n1421 n1422 n1419  nand4_1
Xg558 n1423 n322_43 net2078 n1356 n303_40  aoi22_1
Xg559 n1115 net2090 n1424 n1423  nand3_6
Xg560 n1425 n1418 n1415 n1113  aoi21_1
Xg561 n1426 net2121 net2819 n1280  aoi21_1
Xg562 n1427 net2190 n396_1504  nor2_1
Xg563 n1428 n1194 net1731  nor2_1
Xg564 net2192 n1194 net1731  nor2_1
Xg565 net2193 n1194 net1731  nor2_1
Xg566 net2196 n1053 n1051  nor2_2
Xg567 n1239 net2827 n1300  nor2_1
Xg568 n1139 n1272 net2197 n1429  oai21_1
Xg569 n1140 net1726 n1237 n1430  oai21_1
Xg570 n1431 n1432 n1150 net2908  oai21_4
Xg571 n1433 n1132 n1431  nor2_1
Xg572 n1434 n1607 n283_38 n1613 net2894  aoi22_1
Xg573 n1435 net1810 net1692 n1111 n1128  oai22_1
Xg574 n1436 n1158 n1112 net2738  oai21_4
Xg575 n1437 n1435 n1438 n1436  nor3_2
Xg576 n1439 n1432 net1880 net2749  oai21_4
Xg577 n1440 n1124 n1439  nor2_1
Xg578 n1441 n159_21 n1610 n132_17 n1614  aoi22_1
Xg579 n1442 n1217 n1112 n1443  oai21_4
Xg580 n1444 n1442 n1127 n1130  nor3_2
Xg581 n1445 n1221 n1446 n1134  aoi21_1
Xg582 n1447 n1148 n1223 net1893  aoi21_1
Xg583 n1286 net2048 net1614 net2901  nand3_6
Xg584 n1121 net2048 net1614 net2900  nand3_6
Xg585 n1448 n1602 n990 n1365 n294_39  aoi22_1
Xg586 n1449 n1612 net2921 n1339 net2894  aoi22_1
Xg587 net2220 n1448 n1450 n1449  nand3_6
Xg588 n1451 n159_21 n989 n977 n150_20  aoi22_1
Xg589 n1452 n979 n143_19 n125_15 n1608  aoi22_1
Xg590 net2227 n1451 n1453 n1452  nand3_6
Xg591 n1454 net2695 n128_16 n1610 n1596  aoi22_1
Xg592 net2230 net2081 n1455 n1454  nand3_6
Xg593 net2234 net1726 n1223 net1893  aoi21_1
Xg594 n1456 net2237 n213_26 net1730  aoi21_2
Xg595 n1072 net2237 net2239  nor2_2
Xg596 net2240 net2779 n1457  nand2_1
Xg597 n1458 net2808 net1759  nor2_1
Xg598 n1459 net2198 n1460 n1135  aoi21_1
Xg599 n1461 n232_30 n1599 n226_29 n1596  aoi22_1
Xg600 n1462 n238_31 n988 n264_35 net2921  aoi22_1
Xg601 n1463 n244_32 n1602 n250_33 n983  aoi22_1
Xg602 n1067 n1157 n1158  nand2_1
Xg603 net2263 n13_1 net2849 n20_2  nand3_8
Xg604 n1464 n1465 net2016 net2267  nand3_2
Xg605 n1466 n1602 net2847  nor2_1
Xg606 n1467 n1158 n1464  nor2_2
Xg607 n1264 n244_32 net1783 n1161  nand3_6
Xg608 n1468 n1469 n1470  nand2_5
Xg609 n1471 n981 net2847  nor2_1
Xg610 net1783 n45_5 net2849  nand2_5
Xg611 n1472 net2894 net2822  nor2_2
Xg612 n1197 net2963 net2894 n1472  aoi21_2
Xg613 n1258 n250_33 n1698_48  nand2_1
Xg614 n1473 n974 net2845 net2278 n971  aoi22_1
Xg615 n1474 n1259 net2669 n1475  aoi21_1
Xg616 n1476 net2921 net2822  nor2_4
Xg617 n1477 n1478 n1479 net2830  aoi21_1
Xg618 n1480 n1469 n1470  nand2_1
Xg619 n1481 n1268 net2669 n1482  aoi21_1
Xg620 n1483 n986 net2847  nor2_1
Xg621 n1484 n1150 n1464  nor2_2
Xg622 n1266 n1485 n1486 n1470  nand3_2
Xg623 n1487 net1786 n1266  nor2_1
Xg624 n1270 net2827 n1168  nand2_10
Xg625 n1488 n1234 net2830  nand2_1
Xg626 n1489 n1597 net2822  nor2_1
Xg627 n1490 n1157 n1464  nor2_1
Xg628 n1491 n1160 n1162 n1322  oai21_1
Xg629 n1492 n974 n1491 n1493 n971  aoi22_1
Xg630 n1494 n1599 net2822  nor2_1
Xg631 n1495 n1109 n1464  nor2_1
Xg632 n1496 n1160 n1167 n1326  oai21_8
Xg633 n1497 n974 n1496 n1498 n971  aoi22_2
Xg634 net1985 n1375 n1374  nand2_1
Xg635 n1499 n1500 n1206 n1501  aoi21_1
Xg636 net1996 n1223 net2793  nand2_1
Xg637 n1279 n1400 n1399  nand2_9
Xg638 n1410 n1502 n1206 n1503  aoi21_1
Xg639 net1735 net2198 n1504  xor2_16
Xg640 net2316 n213_26 n1194  nand2_1
Xg641 n1289 n987 n1603  nand2_1
Xg642 n1505 net1759 net1926 n1230  nor3_2
Xg643 n1077 net2959 net1759 n1505  aoi21_1
Xg644 n1506 n264_35 n257_34 n250_33  oai21_4
Xg645 n1507 n1193 n1506  nor2_1
Xg646 n1283 net2324 net1859  xor2_7
Xg647 n1508 n1509 n1510 n1511  nand3_6
Xg648 n361_940 n1508  inv1x_1
Xg649 net1614 net2335 net1825  nand2_7
Xg650 n1512 net2235 n1513 n1456 n1514  nand4_4
Xg651 n409_1670 n1512  inv1x_7
Xg652 n1251 n1151 net1905 n1459  oai21_4
Xg653 net2019 net1763  inv1x_1
Xg654 n1504 net2048 n1515 n1316  nand3_13
Xg655 n1515 n1516 n1517  nand2_1
Xg656 net2048 n1305 n1605 n1313  nand3_2
Xg657 n1518 n1310 n1061  nand2_1
Xg658 n1328 n1269 n1168  nand2_7
Xg659 n1233 n1328  inv1x_1
Xg660 n1319 n1066  inv1x_3
Xg661 n1411 n1092  inv1x_1
Xg662 net1909 net1604  inv1x_3
Xg663 n1206 n1193  inv1x_10
Xg664 n1207 n45_5 net2785 n13_1  nand3_6
Xg665 n1216 n1213  inv1x_3
Xg666 net2078 net1692  inv1x_1
Xg667 n1211 n1209  inv1x_3
Xg668 n1365 n1125  inv1x_1
Xg669 n1349 n1607 n303_40  nand2_1
Xg670 n1348 n1610 n77_9  nand2_1
Xg671 n1356 n1112  inv1x_1
Xg672 n1339 n1128  inv1x_1
Xg673 n1519 n971 net1788 n1213  nand3_6
Xg674 n1337 net2792 n1519  nand2_1
Xg675 n1432 n1337  inv1x_1
Xg676 n1221 n1208  inv1x_1
Xg677 net2081 net1889  inv1x_1
Xg678 n1341 n128_16 n1365  nand2_1
Xg679 n1344 n159_21 n976  nand2_1
Xg680 net2031 net1761  inv1x_12
Xg681 net2013 net2016  inv1x_1
Xg682 net2267 n20_2 n33_3  nand2_2
Xg683 net2014 net2267  inv1x_1
Xg684 n1465 net2787 net1759  nand2_7
Xg685 n1520 n20_2 n33_3  nand2_9
Xg686 n1156 net1765 n1520  nand2_2
Xg687 n1291 n1054  inv1x_12
Xg688 n1171 n1481 net2866 n1304  nand3_4
Xg689 n1186 n1168  inv1x_3
Xg690 n1136 n1118  inv1x_12
Xg691 n1521 net2908 net1779  nand2_9
Xg692 n1470 net2033 n1521  nand2_7
Xg693 n1323 n1470  inv1x_10
Xg694 n1161 net2940 net2849  nand2_1
Xg695 n1522 n1159  inv1x_3
Xg696 n1320 n1087  inv1x_1
Xg697 n1523 n1524 n1525 n1526  nand3_6
Xg698 n1188 n1527 n1528 n1186  nand3_4
Xg699 n1329 n1188  inv1x_1
Xg700 n1189 n1185  inv1x_1
Xg701 net2090 net1891  inv1x_1
Xg702 n1223 n1222  inv1x_1
Xg703 n1347 n984 n990  nand2_1
Xg704 n1352 n1356 net2894  nand2_1
Xg705 n1529 n1223 n1051  nand2_1
Xg706 n1530 net2008 net1880  nand2_1
Xg707 n1166 net2019 n1530 n1318  nand3_6
Xg708 n1123 n1163  inv1x_2
Xg709 n1531 n1603 net2746  nand2_1
Xg710 n1321 n1531  inv1x_1
Xg711 n1082 n223_28 n1522  nand2_1
Xg712 n1493 n1491  inv1x_3
Xg713 net1825 n1492 n1123  nand2_5
Xg714 n1184 n1331 n1163  nand2_1
Xg715 n1190 n1183  inv1x_3
Xg716 n1532 n87_10 net2736  nand2_1
Xg717 n1325 n1532  inv1x_1
Xg718 n1085 n226_29 n1522  nand2_1
Xg719 n1498 n1496  inv1x_11
Xg720 n1533 n986 n1600  nand2_1
Xg721 n1534 net2790 n1066 n1533  nand3_6
Xg722 n1175 net2019 n1534 n1324  nand3_6
Xg723 n1117 n1172  inv1x_3
Xg724 n1332 n1137  inv1x_1
Xg725 n1176 n1497 n1117  nand2_2
Xg726 n1192 n1147  inv1x_2
Xg727 n1535 n1536 n1537 n1538  nand3_6
Xg728 n1539 n1480  inv1x_1
Xg729 n1180 n1301 n1302  nand2_1
Xg730 n1074 n1177  inv1x_11
Xg731 n1234 n1181  inv1x_1
Xg732 n1540 n1327 n1192  nand2_7
Xg733 net2335 n1330 n1540  nand2_7
Xg734 n1182 n1541 n1542 n1074  nand3_12
Xg735 n1191 n1146  inv1x_1
Xg736 net2273 n33_3 net2849  nand2_10
Xg737 n1543 n1544 net2423  nand2_7
Xg738 n1090 n1543  inv1x_1
Xg739 n1545 n1546 n1547 n1548  nand3_4
Xg740 n1255 n1545  inv1x_3
Xg741 net2037 n1549 n1550 n1543  nand3_9
Xg742 net2436 net1838  inv1x_10
Xg743 n1551 net2031 net1810  nand2_7
Xg744 n1552 net2436 net2671  nand2_7
Xg745 n1198 net2664 n1552 n1292 n1551  nand4_5
Xg746 n1553 n1196  inv1x_10
Xg747 net2278 net1842  inv1x_1
Xg748 n1229 n1473 n1553  nand2_7
Xg749 n1299 n1229  inv1x_10
Xg750 n1203 n1474 net2925 n1293  nand3_5
Xg751 net2444 net1852  inv1x_1
Xg752 n1554 n1555 n1556 n1557  nand3_5
Xg753 n1199 n264_35 net2841 net2450  nand3_2
Xg754 n1200 n1554 n1295  nand2_4
Xg755 net2451 net1849  inv1x_11
Xg756 net1906 net1672  inv1x_11
Xg757 n1308 n1558 n1559 net2423 n1544  nand4_2
Xg758 n1300 n1308  inv1x_10
Xg759 n1560 n1095  inv1x_11
Xg760 n1561 net1959 net1852 n1296  oai21_3
Xg761 n1562 n1297 n1561  nand2_4
Xg762 n1563 n1562  inv1x_1
Xg763 net2468 n1298 n1562  nand2_11
Xg764 n1313 net2468 net2037  nand2_7
Xg765 n1068 n1313  inv1x_1
Xg766 n1564 n1308 net2037  nand2_1
Xg767 n1314 n1488  inv1x_1
Xg768 n1316 n1309 n1062  nand2_2
Xg769 net2068 net2901  inv1x_3
Xg770 n1359 n137_18 n1608  nand2_1
Xg771 n1363 n1339 n1595  nand2_1
Xg772 n1362 n975 n150_20  nand2_1
Xg773 n1361 net2694 n143_19  nand2_1
Xg774 n1368 n1609 net2894  nand2_1
Xg775 n1371 n977 net2638  nand2_1
Xg776 net2121 net1895  inv1x_1
Xg777 net2119 net1996  inv1x_1
Xg778 net2488 net1671  inv1x_1
Xg779 n1379 n1610 net2638  nand2_1
Xg780 net2128 n977 n294_39  nand2_1
Xg781 n1382 n1613 n1600  nand2_1
Xg782 n1384 n1356 n1602  nand2_1
Xg783 n1565 n1230  inv1x_1
Xg784 n1386 n1289  inv1x_1
Xg785 n1391 n1611 n988  nand2_1
Xg786 n1393 n1356 n1596  nand2_1
Xg787 n1396 n1609 n984  nand2_1
Xg788 n1398 n977 net2921  nand2_1
Xg789 n1403 n978 n1599  nand2_1
Xg790 net2158 n976 n988  nand2_1
Xg791 n1406 n1610 net2921  nand2_1
Xg792 n1408 n317_42 net2696  nand2_1
Xg793 net2496 net2121 net2858  nand2_1
Xg794 net2498 net1910  inv1x_12
Xg795 net2500 net2498 net1865  nand2_7
Xg796 net2190 net2500  inv1x_1
Xg797 n1413 net2894 n1337  nand2_1
Xg798 n1417 net2695 n1595  nand2_1
Xg799 n1566 n1076  inv1x_1
Xg800 n1567 n1150 n1158  nand2_1
Xg801 n1568 n1567 n1247 n1289  nand3_6
Xg802 n1155 n1248 n1249 n1568  oai21_4
Xg803 n1421 n329_45 n1607  nand2_1
Xg804 n1420 n294_39 n990  nand2_1
Xg805 n1422 n1611 n283_38  nand2_1
Xg806 n1424 n326_44 net2694  nand2_1
Xg807 n1281 n355_399  inv1x_1
Xg808 n1569 n1427 net2779 net2188  nand3_6
Xg809 n1513 n1428 n1569  nand2_1
Xg810 n1453 n137_18 n1614  nand2_1
Xg811 n1450 n1609 n988  nand2_1
Xg812 net2224 n1356 n983  nand2_1
Xg813 n1455 n132_17 net2078  nand2_1
Xg814 net2237 net1610  inv1x_12
Xg815 n1443 n125_15 net2696  nand2_1
Xg816 n1570 net2695 net2638  nand2_1
Xg817 n1438 n1570  inv1x_1
Xg818 n1446 n1571 n1572 n1573  nand3_6
Xg819 net2318 n1447 n1445  nand2_1
Xg820 net2516 net2318  inv1x_1
Xg821 n1460 n1237 n1515  nand2_1
Xg822 n1429 n1135  inv1x_1
Xg823 net2239 net2522  inv1x_3
Xg824 net1601 net2525  inv1x_3
Xg825 net1602 net2528  inv1x_3
Xg826 n1514 net2528 n213_26 net2525  nand3_2
Xg827 n1457 net1744 net1926  nand2_1
Xg828 n1574 n1245  inv1x_1
Xg829 n1065 n1149 n1288 n1458  oai21_4
Xg830 n1575 net2262 n1463 n1462 n1461  nand4_1
Xg831 net2523 net1894 net2318  nand2_1
Xg832 n1071 n1120 n1315 n1333  oai21_10
Xg833 n1517 n1143 n1328  nand2_1
Xg834 n1516 n1232  inv1x_1
Xg835 n1430 n1516 n1517 net2198  nand3_6
Xg836 net1778 net2940 n33_3  nand2_12
Xg837 net2545 net2861 net2743  nand2_8
Xg838 n1243 net2444 net2550  nand2_1
Xg839 n1576 n1468  inv1x_3
Xg840 n1240 n1563 n1299 net2037  oai21_4
Xg841 n1526 n232_30 net2747 n1698_48  nand3_6
Xg842 n1538 n238_31 net2741 n1698_48  nand3_6
Xg843 n1548 net2639 net2746  nand2_1
Xg844 n1557 n294_39 net2736  nand2_10
Xg845 n1573 n1434 n1433 n1437  nand3_6
Xg846 n1511 n1574 n1566  nand2_1
Xg847 n1577 net2115 n1578  xor2_7
Xg848 n1152 n1577  inv1x_1
Xg849 n1376 n1089 n1564  xor2_7
Xg850 n1579 n1376  inv1x_1
Xg851 net2565 n1579 net2486  xor2_7
Xg852 n1153 n1387 n1580  xor2_7
Xg853 n1581 n1153  inv1x_1
Xg854 n1502 net2436 n1582  xor2_7
Xg855 n1154 n1502  inv1x_1
Xg856 net2198 net1726  inv1x_4
Xg857 net1928 net1735  inv1x_10
Xg858 n1148 n1122 n1183  xor2_7
Xg859 net2526 net1744  inv1x_1
Xg860 n1578 n1372  inv1x_1
Xg861 n1580 n1388  inv1x_1
Xg862 n1582 n1409  inv1x_1
Xg863 n1179 n1466  inv1x_1
Xg864 n1178 n1467  inv1x_1
Xg865 n1537 n232_30 net1773 net2742  nand3_6
Xg866 n1536 n107_12 net2744  nand2_1
Xg867 n1265 net1967 n1535  nand2_2
Xg868 n1469 n1263  inv1x_15
Xg869 n1205 n1576 net1813  nand2_9
Xg870 n1204 n1468 net1815  nand2_1
Xg871 net2424 net1909 n1111 net2671  nand3_4
Xg872 n1253 n1471  inv1x_1
Xg873 n1544 n1252  inv1x_10
Xg874 net1952 n250_33 net1783  nand2_9
Xg875 net2540 net1951  inv1x_1
Xg876 n1547 n238_31 net2742 net1773  nand3_6
Xg877 n1546 n244_32 net2741 n1698_48  nand3_6
Xg878 n1256 net1951 net2783  nand2_4
Xg879 n1583 n1254  inv1x_12
Xg880 n1550 n1046 net1815  nand2_1
Xg881 n1549 n1583 net1813  nand2_5
Xg882 n1195 n1086 n1257 net1967  oai21_4
Xg883 n1584 n107_12 net2787  nand2_1
Xg884 n1475 n1584  inv1x_1
Xg885 n1202 n1476  inv1x_16
Xg886 n1201 net2273 net2847 n1294 net2921  nand4_3
Xg887 n1556 n250_33 net2742 net1773  nand3_5
Xg888 n1555 n257_34 net2742 n1698_48  nand3_6
Xg889 n1226 net2451 net1813  nand2_5
Xg890 n1225 net1849 net1815  nand2_9
Xg891 n1559 n1583 n971  nand2_9
Xg892 n1558 n1254 n974  nand2_1
Xg893 n1260 n974 net1849  nand2_7
Xg894 net2550 net1959  inv1x_1
Xg895 n1262 net1842 net1815  nand2_1
Xg896 n1224 n1261  inv1x_11
Xg897 n1479 n179_23 net2539  nand2_1
Xg898 n1478 net2542 net1813  nand2_1
Xg899 n1542 n974 n1480  nand2_1
Xg900 n1541 n1539 n971  nand2_1
Xg901 n1585 n68_8 net2671  nand2_1
Xg902 n1482 n1585  inv1x_1
Xg903 n1170 n1483  inv1x_1
Xg904 n1169 n1484  inv1x_3
Xg905 n1525 n226_29 net1773 net2747  nand3_6
Xg906 n1524 n97_11 net2746  nand2_1
Xg907 n1486 net1967 n1523  nand2_1
Xg908 n1485 n238_31 net1783 n1161 net2783  nand4_2
Xg909 n1528 n974 n1266  nand2_1
Xg910 n1527 n1487  inv1x_1
Xg911 n1267 n1266 net1815  nand2_9
Xg912 n1269 n1187  inv1x_11
Xg913 n1271 n1185 n1270  nand2_8
Xg914 n1238 n1051  inv1x_3
Xg915 n1274 n1314 n1238  nand2_2
Xg916 n1273 n1312 n1518 n1051  nand3_4
Xg917 n1586 n1120  inv1x_3
Xg918 n1165 n1489  inv1x_1
Xg919 n1164 n1490  inv1x_1
Xg920 n1174 n1494  inv1x_1
Xg921 n1173 n1495  inv1x_1
Xg922 n1236 n1498 net1813  nand2_9
Xg923 n1235 n1496 net1815  nand2_1
Xg924 n1587 n169_22 n1491  nand2_1
Xg925 n1331 net1813 n1491 n1587  oai21_4
Xg926 n1070 n1335 n1586 net1893  nand3_13
Xg927 n1069 n1354 n1529 net1993  nand3_6
Xg928 n1228 n1560 net2829  nand2_10
Xg929 n1227 n1095 n1196 net2827  nand3_6
Xg930 n1275 n984 n1193  nand2_1
Xg931 n1588 n1565 n1600 n1385 net1779  nand4_1
Xg932 n1500 net1779 n1581 n1588  oai21_4
Xg933 n1589 net2921 n1193  nand2_1
Xg934 n1501 n1589  inv1x_1
Xg935 n1278 net2119 n1230  nand2_1
Xg936 n1277 n1411 n1499 net1996  nand3_6
Xg937 n1572 n1441 n1440 n1444 net2908  nand4_1
Xg938 n1571 net2861 n1157  nand2_1
Xg939 n1590 net2894 n1193  nand2_1
Xg940 n1503 n1590  inv1x_1
Xg941 n1591 n45_5 n1155  nand2_1
Xg942 n1592 n45_5 n1076 n1591  oai21_4
Xg943 n1593 net2639 n1193  nand2_1
Xg944 n1594 n1592 n1206  nand2_1
Xg945 n1282 n1594 n1593 n1411 net1996  nand4_1
Xg946 n1284 n1426 n1425 net1993  nand3_6
Xg947 n1287 n1285 net2846  nand2_5
Xg948 n1241 n1052  inv1x_10
Xg949 n1290 n1603 n1150 n1595 n1600  nand4_1
Xg950 n1064 n1250 net2537 n1245  nand3_6
Xg951 n1063 net2436 net2638 n1574  nand3_6
Xg952 n1510 n1575 n1245 n1193  nand3_6
Xg953 n1509 n1507  inv1x_1
Xg954 n1596 n1598  inv1x_1
Xg955 n1595 n1598  inv1x_11
Xg956 n1597 n1598  inv1x_1
Xg957 n1598 n50_6  inv1x_10
Xg958 n1599 n1601  inv1x_1
Xg959 n1600 n1601  inv1x_1
Xg960 n1601 n58_7  inv1x_1
Xg961 n1602 n1604  inv1x_10
Xg962 n1603 n1604  inv1x_3
Xg963 n1604 n77_9  inv1x_10
Xg964 net2671 net2669  inv1x_7
Xg965 net2669 n20_2  inv1x_17
Xg966 n1605 n1142  inv1x_12
Xg967 n1606 n1143  inv1x_3
Xg968 net2701 n33_3  inv1x_17
Xg969 n1607 n1125  inv1x_3
Xg970 n1608 n1125  inv1x_1
Xg971 n1610 n1133  inv1x_1
Xg972 n1609 n1133  inv1x_1
Xg973 n1611 n1133  inv1x_1
Xg974 n1613 n1214  inv1x_1
Xg975 n1612 n1214  inv1x_1
Xg976 n1614 n1214  inv1x_1
Cn1_0 n1_0 0 3.3e-15
Cn13_1 n13_1 0 2.97e-14
Cn20_2 n20_2 0 1.32e-14
Cn33_3 n33_3 0 2.64e-14
Cn41_4 n41_4 0 3.3e-15
Cn45_5 n45_5 0 1.65e-14
Cn58_7 n58_7 0 6.6e-15
Cn68_8 n68_8 0 6.6e-15
Cn77_9 n77_9 0 6.6e-15
Cn87_10 n87_10 0 6.6e-15
Cn97_11 n97_11 0 6.6e-15
Cn107_12 n107_12 0 9.9e-15
Cn125_15 n125_15 0 3.3e-15
Cn128_16 n128_16 0 6.6e-15
Cn132_17 n132_17 0 9.9e-15
Cn137_18 n137_18 0 1.32e-14
Cn143_19 n143_19 0 1.65e-14
Cn150_20 n150_20 0 1.98e-14
Cn159_21 n159_21 0 2.31e-14
Cn169_22 n169_22 0 9.9e-15
Cn179_23 n179_23 0 1.32e-14
Cn190_24 n190_24 0 1.32e-14
Cn200_25 n200_25 0 9.9e-15
Cn213_26 n213_26 0 1.32e-14
Cn223_28 n223_28 0 3.3e-15
Cn226_29 n226_29 0 1.32e-14
Cn232_30 n232_30 0 1.32e-14
Cn238_31 n238_31 0 1.32e-14
Cn244_32 n244_32 0 1.32e-14
Cn250_33 n250_33 0 1.65e-14
Cn257_34 n257_34 0 1.65e-14
Cn264_35 n264_35 0 1.32e-14
Cn270_36 n270_36 0 6.6e-15
Cn274_37 n274_37 0 3.3e-15
Cn283_38 n283_38 0 2.97e-14
Cn294_39 n294_39 0 2.31e-14
Cn303_40 n303_40 0 1.98e-14
Cn311_41 n311_41 0 1.32e-14
Cn317_42 n317_42 0 9.9e-15
Cn322_43 n322_43 0 6.6e-15
Cn326_44 n326_44 0 3.3e-15
Cn330_46 n330_46 0 6.6e-15
Cn343_47 n343_47 0 3.3e-15
Cn1698_48 n1698_48 0 2.31e-14
Cn396_1504 n396_1504 0 3.3e-15
Cn387_1616 n387_1616 0 6.6e-15
Cn393_1605 n393_1605 0 6.6e-15
Cn971 n971 0 1.98e-14
Cnet1786 net1786 0 1.98e-14
Cn972 n972 0 3.3e-15
Cnet2893 net2893 0 6.6e-15
Cn973 n973 0 3.3e-15
Cn974 n974 0 2.64e-14
Cn975 n975 0 2.31e-14
Cnet1692 net1692 0 1.65e-14
Cn977 n977 0 1.32e-14
Cn1112 n1112 0 1.98e-14
Cn976 n976 0 1.32e-14
Cn979 n979 0 1.32e-14
Cn1128 n1128 0 1.98e-14
Cn978 n978 0 1.32e-14
Cn980 n980 0 1.32e-14
Cn981 n981 0 6.6e-15
Cn982 n982 0 3.3e-15
Cn983 n983 0 9.9e-15
Cn984 n984 0 1.65e-14
Cn985 n985 0 9.9e-15
Cn986 n986 0 6.6e-15
Cn987 n987 0 6.6e-15
Cn988 n988 0 2.31e-14
Cn990 n990 0 1.65e-14
Cnet2792 net2792 0 9.9e-15
Cn1519 n1519 0 9.9e-15
Cn989 n989 0 1.65e-14
Cnet1856 net1856 0 3.3e-15
Cnet2283 net2283 0 6.6e-15
Cnet1858 net1858 0 6.6e-15
Cnet2541 net2541 0 6.6e-15
Cnet2553 net2553 0 3.3e-15
Cnet1656 net1656 0 9.9e-15
Cnet2943 net2943 0 9.9e-15
Cnet1769 net1769 0 9.9e-15
Cnet1839 net1839 0 9.9e-15
Cn997 n997 0 3.3e-15
Cnet2033 net2033 0 3.3e-15
Cnet2866 net2866 0 9.9e-15
Cnet1951 net1951 0 9.9e-15
Cnet1783 net1783 0 1.65e-14
Cnet1952 net1952 0 3.3e-15
Cnet2460 net2460 0 3.3e-15
Cn991 n991 0 3.3e-15
Cn992 n992 0 3.3e-15
Cn993 n993 0 3.3e-15
Cn996 n996 0 3.3e-15
Cnet2940 net2940 0 9.9e-15
Cnet2939 net2939 0 3.3e-15
Cnet2662 net2662 0 6.6e-15
Cnet2661 net2661 0 9.9e-15
Cnet2924 net2924 0 3.3e-15
Cnet1771 net1771 0 6.6e-15
Cnet2664 net2664 0 9.9e-15
Cnet2461 net2461 0 3.3e-15
Cn994 n994 0 3.3e-15
Cn995 n995 0 3.3e-15
Cnet2741 net2741 0 1.98e-14
Cnet1773 net1773 0 1.98e-14
Cnet1843 net1843 0 6.6e-15
Cnet2841 net2841 0 6.6e-15
Cnet1967 net1967 0 1.65e-14
Cnet2953 net2953 0 3.3e-15
Cnet1563 net1563 0 6.6e-15
Cnet1564 net1564 0 6.6e-15
Cnet2245 net2245 0 3.3e-15
Cnet2945 net2945 0 3.3e-15
Cnet2955 net2955 0 6.6e-15
Cnet2187 net2187 0 6.6e-15
Cnet2500 net2500 0 6.6e-15
Cnet1926 net1926 0 1.65e-14
Cnet1940 net1940 0 3.3e-15
Cnet2954 net2954 0 3.3e-15
Cnet1941 net1941 0 3.3e-15
Cnet2880 net2880 0 3.3e-15
Cn999 n999 0 6.6e-15
Cnet1912 net1912 0 9.9e-15
Cnet1913 net1913 0 9.9e-15
Cn998 n998 0 3.3e-15
Cnet1910 net1910 0 3.3e-15
Cnet1673 net1673 0 9.9e-15
Cnet1640 net1640 0 1.32e-14
Cnet1741 net1741 0 9.9e-15
Cnet1904 net1904 0 1.32e-14
Cnet2733 net2733 0 3.3e-15
Cnet2123 net2123 0 3.3e-15
Cnet1633 net1633 0 2.31e-14
Cnet1991 net1991 0 6.6e-15
Cnet2944 net2944 0 3.3e-15
Cnet2902 net2902 0 6.6e-15
Cnet1859 net1859 0 1.65e-14
Cnet2185 net2185 0 9.9e-15
Cnet2480 net2480 0 6.6e-15
Cnet2167 net2167 0 3.3e-15
Cnet2496 net2496 0 3.3e-15
Cn1003 n1003 0 3.3e-15
Cnet2186 net2186 0 3.3e-15
Cnet1687 net1687 0 3.3e-15
Cn1002 n1002 0 3.3e-15
Cnet2154 net2154 0 3.3e-15
Cn1001 n1001 0 3.3e-15
Cnet1996 net1996 0 1.65e-14
Cnet2081 net2081 0 1.98e-14
Cnet2158 net2158 0 3.3e-15
Cn1000 n1000 0 3.3e-15
Cnet2695 net2695 0 1.98e-14
Cnet1884 net1884 0 9.9e-15
Cnet2694 net2694 0 1.65e-14
Cnet2696 net2696 0 1.65e-14
Cn1004 n1004 0 3.3e-15
Cnet2830 net2830 0 3.3e-14
Cnet1946 net1946 0 3.3e-15
Cnet1613 net1613 0 1.65e-14
Cnet1614 net1614 0 1.65e-14
Cnet1903 net1903 0 6.6e-15
Cnet1905 net1905 0 6.6e-15
Cnet1990 net1990 0 3.3e-15
Cnet1894 net1894 0 2.31e-14
Cnet1669 net1669 0 9.9e-15
Cnet1629 net1629 0 9.9e-15
Cnet2829 net2829 0 6.6e-15
Cnet2468 net2468 0 6.6e-15
Cnet2037 net2037 0 1.65e-14
Cnet1739 net1739 0 6.6e-15
Cnet1740 net1740 0 3.3e-15
Cnet2138 net2138 0 3.3e-15
Cnet2121 net2121 0 1.32e-14
Cnet1674 net1674 0 3.3e-15
Cnet1959 net1959 0 1.32e-14
Cnet1852 net1852 0 2.31e-14
Cnet1672 net1672 0 6.6e-15
Cnet2478 net2478 0 3.3e-15
Cnet1738 net1738 0 3.3e-15
Cnet2967 net2967 0 3.3e-15
Cnet2818 net2818 0 3.3e-15
Cnet2814 net2814 0 3.3e-15
Cnet2324 net2324 0 6.6e-15
Cnet2482 net2482 0 6.6e-15
Cnet2323 net2323 0 3.3e-15
Cnet2825 net2825 0 3.3e-15
Cnet2286 net2286 0 6.6e-15
Cn1005 n1005 0 3.3e-15
Cnet1641 net1641 0 6.6e-15
Cnet2490 net2490 0 3.3e-15
Cnet2488 net2488 0 3.3e-15
Cnet2882 net2882 0 3.3e-15
Cn1006 n1006 0 3.3e-15
Cnet2484 net2484 0 6.6e-15
Cnet2095 net2095 0 6.6e-15
Cnet2486 net2486 0 3.3e-15
Cnet2097 net2097 0 3.3e-15
Cnet2858 net2858 0 9.9e-15
Cnet2968 net2968 0 9.9e-15
Cnet1978 net1978 0 6.6e-15
Cnet2837 net2837 0 9.9e-15
Cnet2595 net2595 0 3.3e-15
Cnet1961 net1961 0 9.9e-15
Cnet1976 net1976 0 3.3e-15
Cnet2931 net2931 0 6.6e-15
Cnet1963 net1963 0 3.3e-15
Cnet1813 net1813 0 2.64e-14
Cnet2930 net2930 0 6.6e-15
Cnet2542 net2542 0 3.3e-15
Cnet1849 net1849 0 1.65e-14
Cnet2845 net2845 0 9.9e-15
Cnet1962 net1962 0 6.6e-15
Cnet2663 net2663 0 1.32e-14
Cnet1778 net1778 0 6.6e-15
Cnet2849 net2849 0 2.31e-14
Cnet2537 net2537 0 3.3e-15
Cnet1765 net1765 0 1.98e-14
Cnet2450 net2450 0 3.3e-15
Cnet2545 net2545 0 3.3e-15
Cnet2423 net2423 0 6.6e-15
Cnet2424 net2424 0 3.3e-15
Cnet2425 net2425 0 3.3e-15
Cnet2007 net2007 0 3.3e-15
Cnet2340 net2340 0 6.6e-15
Cnet2861 net2861 0 1.32e-14
Cnet2262 net2262 0 3.3e-15
Cnet2639 net2639 0 1.65e-14
Cnet2115 net2115 0 3.3e-15
Cnet1845 net1845 0 9.9e-15
Cnet2783 net2783 0 2.31e-14
Cnet2867 net2867 0 9.9e-15
Cnet2481 net2481 0 6.6e-15
Cnet2961 net2961 0 3.3e-15
Cnet2197 net2197 0 3.3e-15
Cnet2198 net2198 0 1.98e-14
Cnet2196 net2196 0 3.3e-15
Cnet2254 net2254 0 3.3e-15
Cnet2255 net2255 0 3.3e-15
Cnet2252 net2252 0 6.6e-15
Cnet2325 net2325 0 3.3e-15
Cnet2574 net2574 0 3.3e-15
Cnet1746 net1746 0 3.3e-15
Cnet2251 net2251 0 3.3e-15
Cnet2246 net2246 0 3.3e-15
Cnet2575 net2575 0 3.3e-15
Cn1009 n1009 0 3.3e-15
Cn1010 n1010 0 3.3e-15
Cnet1296 net1296 0 6.6e-15
Cn1008 n1008 0 6.6e-15
Cnet2243 net2243 0 3.3e-15
Cnet1609 net1609 0 1.32e-14
Cnet2247 net2247 0 3.3e-15
Cnet5695 net5695 0 6.6e-15
Cnet1893 net1893 0 3.3e-14
Cnet1985 net1985 0 3.3e-15
Cn1007 n1007 0 3.3e-15
Cnet1622 net1622 0 3.3e-15
Cnet2240 net2240 0 3.3e-15
Cnet2235 net2235 0 3.3e-15
Cnet2193 net2193 0 3.3e-15
Cnet2192 net2192 0 3.3e-15
Cnet2565 net2565 0 3.3e-15
Cnet2492 net2492 0 3.3e-15
Cnet1939 net1939 0 9.9e-15
Cnet2959 net2959 0 3.3e-15
Cnet1625 net1625 0 3.3e-15
Cn1011 n1011 0 3.3e-15
Cnet1621 net1621 0 3.3e-15
Cnet2188 net2188 0 3.3e-15
Cn1014 n1014 0 3.3e-15
Cn1015 n1015 0 3.3e-15
Cnet2139 net2139 0 3.3e-15
Cnet1993 net1993 0 1.65e-14
Cnet1675 net1675 0 3.3e-15
Cn1012 n1012 0 3.3e-15
Cnet2090 net2090 0 2.31e-14
Cnet2128 net2128 0 3.3e-15
Cn1013 n1013 0 3.3e-15
Cnet2078 net2078 0 1.98e-14
Cnet1747 net1747 0 3.3e-15
Cnet2532 net2532 0 3.3e-15
Cnet2316 net2316 0 6.6e-15
Cn1021 n1021 0 3.3e-15
Cnet2002 net2002 0 3.3e-15
Cnet1927 net1927 0 3.3e-15
Cnet1730 net1730 0 3.3e-15
Cnet1731 net1731 0 1.32e-14
Cnet1610 net1610 0 6.6e-15
Cnet1928 net1928 0 3.3e-15
Cn1016 n1016 0 3.3e-15
Cnet2234 net2234 0 3.3e-15
Cn1020 n1020 0 3.3e-15
Cnet1702 net1702 0 3.3e-15
Cn1019 n1019 0 3.3e-15
Cnet2227 net2227 0 3.3e-15
Cnet2230 net2230 0 3.3e-15
Cnet2220 net2220 0 3.3e-15
Cn1018 n1018 0 3.3e-15
Cnet2224 net2224 0 3.3e-15
Cn1017 n1017 0 3.3e-15
Cnet2816 net2816 0 3.3e-15
Cnet2827 net2827 0 1.98e-14
Cnet2539 net2539 0 3.3e-15
Cnet2540 net2540 0 3.3e-15
Cnet2451 net2451 0 6.6e-15
Cnet2278 net2278 0 6.6e-15
Cnet2017 net2017 0 3.3e-15
Cn1023 n1023 0 3.3e-15
Cn1027 n1027 0 3.3e-15
Cn1025 n1025 0 6.6e-15
Cnet2638 net2638 0 1.98e-14
Cn1026 n1026 0 3.3e-15
Cnet2263 net2263 0 9.9e-15
Cnet2637 net2637 0 9.9e-15
Cnet2640 net2640 0 1.98e-14
Cn1022 n1022 0 3.3e-15
Cnet2928 net2928 0 6.6e-15
Cnet2273 net2273 0 6.6e-15
Cnet2267 net2267 0 9.9e-15
Cnet2016 net2016 0 1.32e-14
Cnet2911 net2911 0 3.3e-15
Cn1024 n1024 0 3.3e-15
Cnet2008 net2008 0 2.31e-14
Cnet1799 net1799 0 1.32e-14
Cnet2740 net2740 0 3.3e-15
Cnet2669 net2669 0 2.31e-14
Cnet2530 net2530 0 6.6e-15
Cn1034 n1034 0 3.3e-15
Cn1036 n1036 0 3.3e-15
Cn1035 n1035 0 3.3e-15
Cn1028 n1028 0 3.3e-15
Cn1033 n1033 0 3.3e-15
Cnet2318 net2318 0 9.9e-15
Cnet1744 net1744 0 1.65e-14
Cn1029 n1029 0 3.3e-15
Cnet2846 net2846 0 6.6e-15
Cn1037 n1037 0 3.3e-15
Cn1030 n1030 0 6.6e-15
Cn1031 n1031 0 3.3e-15
Cnet1865 net1865 0 6.6e-15
Cnet2335 net2335 0 9.9e-15
Cnet1825 net1825 0 9.9e-15
Cnet2949 net2949 0 3.3e-15
Cn1032 n1032 0 3.3e-15
Cnet2936 net2936 0 1.65e-14
Cnet2900 net2900 0 9.9e-15
Cnet2048 net2048 0 2.31e-14
Cn1044 n1044 0 6.6e-15
Cn1040 n1040 0 3.3e-15
Cnet2522 net2522 0 1.32e-14
Cn1043 n1043 0 3.3e-15
Cnet2525 net2525 0 6.6e-15
Cnet2526 net2526 0 3.3e-15
Cn1041 n1041 0 3.3e-15
Cn1042 n1042 0 3.3e-15
Cn1039 n1039 0 3.3e-15
Cnet2891 net2891 0 9.9e-15
Cn1038 n1038 0 3.3e-15
Cnet2901 net2901 0 9.9e-15
Cnet1864 net1864 0 6.6e-15
Cnet2516 net2516 0 3.3e-15
Cnet2523 net2523 0 3.3e-15
Cnet2528 net2528 0 6.6e-15
Cnet1838 net1838 0 3.3e-15
Cnet1810 net1810 0 1.65e-14
Cnet1604 net1604 0 9.9e-15
Cnet1762 net1762 0 6.6e-15
Cnet1763 net1763 0 6.6e-15
Cnet1761 net1761 0 6.6e-15
Cn1225 n1225 0 6.6e-15
Cn1226 n1226 0 6.6e-15
Cn1045 n1045 0 3.3e-15
Cn1306 n1306 0 6.6e-15
Cn1307 n1307 0 6.6e-15
Cn1046 n1046 0 3.3e-15
Cn1255 n1255 0 6.6e-15
Cn1256 n1256 0 6.6e-15
Cnet2963 net2963 0 3.3e-15
Cn1047 n1047 0 9.9e-15
Cn1242 n1242 0 6.6e-15
Cn1243 n1243 0 6.6e-15
Cn1048 n1048 0 3.3e-15
Cnet2948 net2948 0 3.3e-15
Cn1145 n1145 0 3.3e-15
Cn1049 n1049 0 3.3e-15
Cn1086 n1086 0 6.6e-15
Cn1257 n1257 0 6.6e-15
Cn1273 n1273 0 6.6e-15
Cn1274 n1274 0 6.6e-15
Cnet2925 net2925 0 9.9e-15
Cnet2920 net2920 0 3.3e-15
Cnet2921 net2921 0 2.97e-14
Cn1050 n1050 0 3.3e-15
Cn1269 n1269 0 1.32e-14
Cn1270 n1270 0 1.32e-14
Cn1271 n1271 0 9.9e-15
Cn1051 n1051 0 1.65e-14
Cnet2908 net2908 0 1.32e-14
Cn1309 n1309 0 9.9e-15
Cn1062 n1062 0 1.32e-14
Cn1052 n1052 0 3.3e-15
Cn1119 n1119 0 6.6e-15
Cn1287 n1287 0 6.6e-15
Cn1246 n1246 0 3.3e-15
Cn1053 n1053 0 1.32e-14
Cn1060 n1060 0 6.6e-15
Cnet2894 net2894 0 3.3e-14
Cn1054 n1054 0 6.6e-15
Cn1520 n1520 0 6.6e-15
Cn1504 n1504 0 9.9e-15
Cn1055 n1055 0 3.3e-15
Cn1315 n1315 0 6.6e-15
Cn1333 n1333 0 6.6e-15
Cn1056 n1056 0 3.3e-15
Cn1057 n1057 0 3.3e-15
Cn1292 n1292 0 3.3e-15
Cn1158 n1158 0 1.98e-14
Cn1058 n1058 0 6.6e-15
Cn1073 n1073 0 6.6e-15
Cn1146 n1146 0 9.9e-15
Cn1059 n1059 0 3.3e-15
Cn1605 n1605 0 6.6e-15
Cnet2874 net2874 0 3.3e-15
Cn1606 n1606 0 3.3e-15
Cn1069 n1069 0 6.6e-15
Cn1070 n1070 0 6.6e-15
Cnet2847 net2847 0 1.32e-14
Cnet2821 net2821 0 6.6e-15
Cnet2822 net2822 0 1.32e-14
Cnet2819 net2819 0 3.3e-15
Cn1075 n1075 0 3.3e-15
Cn1477 n1477 0 9.9e-15
Cn1061 n1061 0 3.3e-15
Cn1272 n1272 0 3.3e-15
Cnet2808 net2808 0 6.6e-15
Cnet2784 net2784 0 1.32e-14
Cnet2671 net2671 0 1.65e-14
Cnet2785 net2785 0 1.65e-14
Cnet2787 net2787 0 6.6e-15
Cnet2794 net2794 0 9.9e-15
Cnet2788 net2788 0 6.6e-15
Cnet2790 net2790 0 3.3e-15
Cnet2791 net2791 0 3.3e-15
Cnet2793 net2793 0 6.6e-15
Cnet2779 net2779 0 9.9e-15
Cnet2736 net2736 0 1.32e-14
Cnet2701 net2701 0 9.9e-15
Cnet2738 net2738 0 6.6e-15
Cnet1755 net1755 0 9.9e-15
Cnet2749 net2749 0 9.9e-15
Cnet2742 net2742 0 2.64e-14
Cnet2743 net2743 0 6.6e-15
Cnet2744 net2744 0 6.6e-15
Cnet2746 net2746 0 1.65e-14
Cnet2747 net2747 0 6.6e-15
Cn1063 n1063 0 3.3e-15
Cn1064 n1064 0 3.3e-15
Cn1065 n1065 0 3.3e-15
Cnet1601 net1601 0 3.3e-15
Cnet1602 net1602 0 3.3e-15
Cn1066 n1066 0 1.32e-14
Cn1067 n1067 0 3.3e-15
Cn1068 n1068 0 3.3e-15
Cn1071 n1071 0 3.3e-15
Cn1072 n1072 0 3.3e-15
Cn1074 n1074 0 6.6e-15
Cn1076 n1076 0 9.9e-15
Cn1077 n1077 0 3.3e-15
Cn1078 n1078 0 3.3e-15
Cn1079 n1079 0 1.32e-14
Cn1080 n1080 0 3.3e-15
Cn1081 n1081 0 3.3e-15
Cn1082 n1082 0 3.3e-15
Cn1083 n1083 0 3.3e-15
Cn1084 n1084 0 3.3e-15
Cn1085 n1085 0 3.3e-15
Cn1087 n1087 0 6.6e-15
Cn1088 n1088 0 3.3e-15
Cn1089 n1089 0 3.3e-15
Cn1090 n1090 0 3.3e-15
Cn1091 n1091 0 3.3e-15
Cn1092 n1092 0 6.6e-15
Cn1093 n1093 0 3.3e-15
Cn1094 n1094 0 3.3e-15
Cn1095 n1095 0 9.9e-15
Cnet1671 net1671 0 3.3e-15
Cn1096 n1096 0 3.3e-15
Cn1097 n1097 0 3.3e-15
Cn1098 n1098 0 3.3e-15
Cn1099 n1099 0 3.3e-15
Cn1100 n1100 0 3.3e-15
Cn1101 n1101 0 3.3e-15
Cn1102 n1102 0 3.3e-15
Cn1103 n1103 0 3.3e-15
Cn1104 n1104 0 3.3e-15
Cn1105 n1105 0 3.3e-15
Cn1603 n1603 0 1.98e-14
Cn1106 n1106 0 3.3e-15
Cn1107 n1107 0 3.3e-15
Cn1108 n1108 0 3.3e-15
Cn1109 n1109 0 1.98e-14
Cn1110 n1110 0 3.3e-15
Cn1111 n1111 0 1.98e-14
Cn1113 n1113 0 3.3e-15
Cn1114 n1114 0 3.3e-15
Cn1115 n1115 0 3.3e-15
Cn1116 n1116 0 3.3e-15
Cn1117 n1117 0 6.6e-15
Cn1118 n1118 0 9.9e-15
Cn1600 n1600 0 2.31e-14
Cn1121 n1121 0 3.3e-15
Cn1122 n1122 0 3.3e-15
Cn1123 n1123 0 6.6e-15
Cn1124 n1124 0 3.3e-15
Cn1125 n1125 0 1.65e-14
Cn1126 n1126 0 3.3e-15
Cn1127 n1127 0 3.3e-15
Cn1129 n1129 0 3.3e-15
Cn1130 n1130 0 3.3e-15
Cn1131 n1131 0 3.3e-15
Cn1132 n1132 0 3.3e-15
Cn1133 n1133 0 1.65e-14
Cn1134 n1134 0 3.3e-15
Cn1597 n1597 0 1.98e-14
Cn1135 n1135 0 6.6e-15
Cn1136 n1136 0 6.6e-15
Cn1137 n1137 0 9.9e-15
Cn1138 n1138 0 3.3e-15
Cn1139 n1139 0 3.3e-15
Cn1140 n1140 0 3.3e-15
Cn1141 n1141 0 3.3e-15
Cnet1726 net1726 0 1.32e-14
Cn1144 n1144 0 3.3e-15
Cn1142 n1142 0 6.6e-15
Cn1147 n1147 0 6.6e-15
Cn1148 n1148 0 6.6e-15
Cn1149 n1149 0 3.3e-15
Cn1596 n1596 0 1.98e-14
Cn1150 n1150 0 2.97e-14
Cn1151 n1151 0 3.3e-15
Cn1152 n1152 0 6.6e-15
Cn1153 n1153 0 6.6e-15
Cn1154 n1154 0 3.3e-15
Cn1155 n1155 0 6.6e-15
Cnet1759 net1759 0 1.65e-14
Cn1156 n1156 0 3.3e-15
Cn1157 n1157 0 1.32e-14
Cn1595 n1595 0 1.98e-14
Cn1159 n1159 0 3.3e-15
Cnet1779 net1779 0 9.9e-15
Cn1160 n1160 0 6.6e-15
Cn1161 n1161 0 9.9e-15
Cn1162 n1162 0 3.3e-15
Cnet1788 net1788 0 1.65e-14
Cn1163 n1163 0 9.9e-15
Cn1164 n1164 0 3.3e-15
Cn1165 n1165 0 3.3e-15
Cn1166 n1166 0 3.3e-15
Cn1167 n1167 0 3.3e-15
Cn1168 n1168 0 9.9e-15
Cn1169 n1169 0 3.3e-15
Cn1170 n1170 0 3.3e-15
Cn1171 n1171 0 3.3e-15
Cn1172 n1172 0 6.6e-15
Cn1173 n1173 0 3.3e-15
Cn1174 n1174 0 3.3e-15
Cn1175 n1175 0 3.3e-15
Cn1176 n1176 0 3.3e-15
Cnet1815 net1815 0 1.98e-14
Cn1177 n1177 0 6.6e-15
Cn1178 n1178 0 3.3e-15
Cn1179 n1179 0 3.3e-15
Cn1180 n1180 0 3.3e-15
Cn1181 n1181 0 9.9e-15
Cn1182 n1182 0 3.3e-15
Cn1183 n1183 0 6.6e-15
Cn1184 n1184 0 3.3e-15
Cn1185 n1185 0 6.6e-15
Cn1186 n1186 0 6.6e-15
Cn1187 n1187 0 6.6e-15
Cn1188 n1188 0 6.6e-15
Cn1189 n1189 0 3.3e-15
Cn1190 n1190 0 3.3e-15
Cn1191 n1191 0 3.3e-15
Cn1192 n1192 0 6.6e-15
Cn1193 n1193 0 2.64e-14
Cn1194 n1194 0 1.32e-14
Cnet1840 net1840 0 3.3e-15
Cnet1842 net1842 0 6.6e-15
Cn1195 n1195 0 3.3e-15
Cn1196 n1196 0 1.65e-14
Cn1197 n1197 0 3.3e-15
Cn1198 n1198 0 3.3e-15
Cn1199 n1199 0 3.3e-15
Cn1200 n1200 0 3.3e-15
Cn1201 n1201 0 3.3e-15
Cn1202 n1202 0 3.3e-15
Cn1203 n1203 0 3.3e-15
Cn1204 n1204 0 3.3e-15
Cn1205 n1205 0 3.3e-15
Cn1206 n1206 0 1.32e-14
Cn1207 n1207 0 3.3e-15
Cn1208 n1208 0 9.9e-15
Cn1209 n1209 0 3.3e-15
Cn1210 n1210 0 3.3e-15
Cn1211 n1211 0 9.9e-15
Cn1212 n1212 0 6.6e-15
Cn1213 n1213 0 6.6e-15
Cn1214 n1214 0 1.32e-14
Cn1215 n1215 0 3.3e-15
Cn1216 n1216 0 1.32e-14
Cn1217 n1217 0 3.3e-15
Cnet1880 net1880 0 6.6e-15
Cn1218 n1218 0 3.3e-15
Cn1219 n1219 0 3.3e-15
Cn1220 n1220 0 3.3e-15
Cnet1887 net1887 0 6.6e-15
Cnet1889 net1889 0 6.6e-15
Cn1221 n1221 0 9.9e-15
Cnet1891 net1891 0 3.3e-15
Cn1222 n1222 0 6.6e-15
Cnet1895 net1895 0 6.6e-15
Cn1223 n1223 0 1.98e-14
Cn1224 n1224 0 9.9e-15
Cn1227 n1227 0 3.3e-15
Cn1228 n1228 0 3.3e-15
Cn1229 n1229 0 9.9e-15
Cnet1906 net1906 0 6.6e-15
Cn1230 n1230 0 9.9e-15
Cn1231 n1231 0 3.3e-15
Cnet1909 net1909 0 6.6e-15
Cn1232 n1232 0 3.3e-15
Cn1233 n1233 0 3.3e-15
Cn1234 n1234 0 6.6e-15
Cn1235 n1235 0 3.3e-15
Cn1236 n1236 0 3.3e-15
Cn1237 n1237 0 6.6e-15
Cn1238 n1238 0 6.6e-15
Cn1239 n1239 0 3.3e-15
Cn1240 n1240 0 3.3e-15
Cn1241 n1241 0 3.3e-15
Cn1244 n1244 0 3.3e-15
Cn1245 n1245 0 9.9e-15
Cn1247 n1247 0 3.3e-15
Cn1248 n1248 0 3.3e-15
Cn1599 n1599 0 1.98e-14
Cn1249 n1249 0 3.3e-15
Cn1602 n1602 0 2.31e-14
Cn1250 n1250 0 3.3e-15
Cn1251 n1251 0 3.3e-15
Cn1252 n1252 0 3.3e-15
Cn1253 n1253 0 3.3e-15
Cn1254 n1254 0 6.6e-15
Cn1258 n1258 0 3.3e-15
Cn1259 n1259 0 3.3e-15
Cn1260 n1260 0 3.3e-15
Cn1261 n1261 0 3.3e-15
Cn1262 n1262 0 3.3e-15
Cn1263 n1263 0 3.3e-15
Cn1264 n1264 0 3.3e-15
Cn1265 n1265 0 3.3e-15
Cn1266 n1266 0 1.32e-14
Cn1267 n1267 0 3.3e-15
Cn1268 n1268 0 3.3e-15
Cn1143 n1143 0 6.6e-15
Cn1120 n1120 0 6.6e-15
Cn1275 n1275 0 3.3e-15
Cn1276 n1276 0 3.3e-15
Cn1277 n1277 0 3.3e-15
Cn1278 n1278 0 3.3e-15
Cn1279 n1279 0 3.3e-15
Cn1280 n1280 0 3.3e-15
Cn1281 n1281 0 3.3e-15
Cn1282 n1282 0 3.3e-15
Cn1283 n1283 0 3.3e-15
Cn1284 n1284 0 3.3e-15
Cn1285 n1285 0 3.3e-15
Cn1286 n1286 0 3.3e-15
Cn1288 n1288 0 3.3e-15
Cn1289 n1289 0 9.9e-15
Cn1290 n1290 0 3.3e-15
Cn1291 n1291 0 1.32e-14
Cn1293 n1293 0 3.3e-15
Cn1294 n1294 0 3.3e-15
Cnet2013 net2013 0 3.3e-15
Cnet2014 net2014 0 3.3e-15
Cn1295 n1295 0 3.3e-15
Cn1296 n1296 0 3.3e-15
Cn1297 n1297 0 3.3e-15
Cn1298 n1298 0 3.3e-15
Cn1299 n1299 0 6.6e-15
Cn1300 n1300 0 6.6e-15
Cn1301 n1301 0 3.3e-15
Cn1302 n1302 0 3.3e-15
Cnet2031 net2031 0 1.32e-14
Cn1303 n1303 0 3.3e-15
Cn1304 n1304 0 3.3e-15
Cn1305 n1305 0 3.3e-15
Cn1308 n1308 0 9.9e-15
Cn1310 n1310 0 3.3e-15
Cn1311 n1311 0 3.3e-15
Cn1312 n1312 0 3.3e-15
Cn1313 n1313 0 9.9e-15
Cn1314 n1314 0 6.6e-15
Cn1317 n1317 0 3.3e-15
Cn1318 n1318 0 3.3e-15
Cn1319 n1319 0 3.3e-15
Cn1320 n1320 0 6.6e-15
Cn1321 n1321 0 3.3e-15
Cn1322 n1322 0 3.3e-15
Cn1323 n1323 0 6.6e-15
Cn1324 n1324 0 3.3e-15
Cn1325 n1325 0 3.3e-15
Cn1326 n1326 0 3.3e-15
Cn1327 n1327 0 3.3e-15
Cn1328 n1328 0 9.9e-15
Cn1329 n1329 0 3.3e-15
Cn1330 n1330 0 3.3e-15
Cn1331 n1331 0 6.6e-15
Cn1332 n1332 0 3.3e-15
Cn1334 n1334 0 3.3e-15
Cn1335 n1335 0 3.3e-15
Cnet2068 net2068 0 3.3e-15
Cn1336 n1336 0 3.3e-15
Cn1609 n1609 0 1.65e-14
Cn1338 n1338 0 3.3e-15
Cn1612 n1612 0 1.65e-14
Cn1340 n1340 0 3.3e-15
Cn1341 n1341 0 3.3e-15
Cn1342 n1342 0 3.3e-15
Cn1343 n1343 0 3.3e-15
Cn1344 n1344 0 3.3e-15
Cn1345 n1345 0 3.3e-15
Cn1346 n1346 0 3.3e-15
Cn1347 n1347 0 3.3e-15
Cn1348 n1348 0 3.3e-15
Cn1349 n1349 0 3.3e-15
Cn1350 n1350 0 3.3e-15
Cn1614 n1614 0 1.65e-14
Cn1351 n1351 0 3.3e-15
Cn1352 n1352 0 3.3e-15
Cn1353 n1353 0 3.3e-15
Cn1354 n1354 0 3.3e-15
Cn1355 n1355 0 3.3e-15
Cn1357 n1357 0 3.3e-15
Cn1611 n1611 0 1.32e-14
Cn1613 n1613 0 1.65e-14
Cn1358 n1358 0 3.3e-15
Cn1359 n1359 0 3.3e-15
Cn1360 n1360 0 3.3e-15
Cn1361 n1361 0 3.3e-15
Cn1362 n1362 0 3.3e-15
Cn1363 n1363 0 3.3e-15
Cn1364 n1364 0 3.3e-15
Cn1337 n1337 0 1.65e-14
Cn1607 n1607 0 1.98e-14
Cn1366 n1366 0 3.3e-15
Cn1367 n1367 0 3.3e-15
Cn1368 n1368 0 3.3e-15
Cn1369 n1369 0 3.3e-15
Cn1370 n1370 0 3.3e-15
Cn1371 n1371 0 3.3e-15
Cn1372 n1372 0 3.3e-15
Cn1373 n1373 0 3.3e-15
Cn1374 n1374 0 3.3e-15
Cnet2119 net2119 0 6.6e-15
Cn1375 n1375 0 3.3e-15
Cn1376 n1376 0 6.6e-15
Cn1377 n1377 0 3.3e-15
Cn1608 n1608 0 1.65e-14
Cn1378 n1378 0 3.3e-15
Cn1339 n1339 0 1.65e-14
Cn1379 n1379 0 3.3e-15
Cn1380 n1380 0 3.3e-15
Cn1381 n1381 0 3.3e-15
Cn1382 n1382 0 3.3e-15
Cn1383 n1383 0 3.3e-15
Cn1384 n1384 0 3.3e-15
Cn1385 n1385 0 3.3e-15
Cn1386 n1386 0 3.3e-15
Cn1387 n1387 0 3.3e-15
Cn1388 n1388 0 3.3e-15
Cn1389 n1389 0 3.3e-15
Cn1390 n1390 0 3.3e-15
Cn1391 n1391 0 3.3e-15
Cn1392 n1392 0 3.3e-15
Cn1393 n1393 0 3.3e-15
Cn1394 n1394 0 3.3e-15
Cn1365 n1365 0 9.9e-15
Cn1395 n1395 0 3.3e-15
Cn1396 n1396 0 3.3e-15
Cn1397 n1397 0 3.3e-15
Cn1398 n1398 0 3.3e-15
Cn1399 n1399 0 3.3e-15
Cn1400 n1400 0 3.3e-15
Cn1401 n1401 0 3.3e-15
Cn1402 n1402 0 3.3e-15
Cn1403 n1403 0 3.3e-15
Cn1404 n1404 0 3.3e-15
Cn1405 n1405 0 3.3e-15
Cn1406 n1406 0 3.3e-15
Cn1407 n1407 0 3.3e-15
Cn1408 n1408 0 3.3e-15
Cn1409 n1409 0 3.3e-15
Cn1410 n1410 0 3.3e-15
Cn1411 n1411 0 9.9e-15
Cn1412 n1412 0 3.3e-15
Cn1413 n1413 0 3.3e-15
Cn1414 n1414 0 3.3e-15
Cn1415 n1415 0 3.3e-15
Cn1416 n1416 0 3.3e-15
Cn1417 n1417 0 3.3e-15
Cn1418 n1418 0 3.3e-15
Cn1419 n1419 0 3.3e-15
Cn1420 n1420 0 3.3e-15
Cn1421 n1421 0 3.3e-15
Cn1422 n1422 0 3.3e-15
Cn1423 n1423 0 3.3e-15
Cn1356 n1356 0 1.65e-14
Cn1424 n1424 0 3.3e-15
Cn1425 n1425 0 3.3e-15
Cn1426 n1426 0 3.3e-15
Cn1427 n1427 0 3.3e-15
Cnet2190 net2190 0 3.3e-15
Cn1428 n1428 0 3.3e-15
Cn1429 n1429 0 3.3e-15
Cn1430 n1430 0 3.3e-15
Cn1431 n1431 0 3.3e-15
Cn1432 n1432 0 6.6e-15
Cn1433 n1433 0 3.3e-15
Cn1434 n1434 0 3.3e-15
Cn1435 n1435 0 3.3e-15
Cn1436 n1436 0 3.3e-15
Cn1437 n1437 0 3.3e-15
Cn1438 n1438 0 3.3e-15
Cn1439 n1439 0 3.3e-15
Cn1440 n1440 0 3.3e-15
Cn1441 n1441 0 3.3e-15
Cn1610 n1610 0 1.65e-14
Cn1442 n1442 0 3.3e-15
Cn1443 n1443 0 3.3e-15
Cn1444 n1444 0 3.3e-15
Cn1445 n1445 0 3.3e-15
Cn1446 n1446 0 3.3e-15
Cn1447 n1447 0 3.3e-15
Cn1448 n1448 0 3.3e-15
Cn1449 n1449 0 3.3e-15
Cn1450 n1450 0 3.3e-15
Cn1451 n1451 0 3.3e-15
Cn1452 n1452 0 3.3e-15
Cn1453 n1453 0 3.3e-15
Cn1454 n1454 0 3.3e-15
Cn1455 n1455 0 3.3e-15
Cn1456 n1456 0 3.3e-15
Cnet2237 net2237 0 6.6e-15
Cnet2239 net2239 0 3.3e-15
Cn1457 n1457 0 3.3e-15
Cn1458 n1458 0 3.3e-15
Cn1459 n1459 0 3.3e-15
Cn1460 n1460 0 3.3e-15
Cn1461 n1461 0 3.3e-15
Cn1462 n1462 0 3.3e-15
Cn1463 n1463 0 3.3e-15
Cn1464 n1464 0 1.32e-14
Cn1465 n1465 0 3.3e-15
Cn1466 n1466 0 3.3e-15
Cn1467 n1467 0 3.3e-15
Cn1468 n1468 0 6.6e-15
Cn1469 n1469 0 6.6e-15
Cn1470 n1470 0 1.32e-14
Cn1471 n1471 0 3.3e-15
Cn1472 n1472 0 3.3e-15
Cn1473 n1473 0 3.3e-15
Cn1474 n1474 0 3.3e-15
Cn1475 n1475 0 3.3e-15
Cn1476 n1476 0 3.3e-15
Cn1478 n1478 0 3.3e-15
Cn1479 n1479 0 3.3e-15
Cn1480 n1480 0 6.6e-15
Cn1481 n1481 0 3.3e-15
Cn1482 n1482 0 3.3e-15
Cn1483 n1483 0 3.3e-15
Cn1484 n1484 0 3.3e-15
Cn1485 n1485 0 3.3e-15
Cn1486 n1486 0 3.3e-15
Cn1487 n1487 0 3.3e-15
Cn1488 n1488 0 3.3e-15
Cn1489 n1489 0 3.3e-15
Cn1490 n1490 0 3.3e-15
Cn1491 n1491 0 1.32e-14
Cn1492 n1492 0 3.3e-15
Cn1493 n1493 0 3.3e-15
Cn1494 n1494 0 3.3e-15
Cn1495 n1495 0 3.3e-15
Cn1496 n1496 0 9.9e-15
Cn1497 n1497 0 3.3e-15
Cn1498 n1498 0 6.6e-15
Cn1499 n1499 0 3.3e-15
Cn1500 n1500 0 3.3e-15
Cn1501 n1501 0 3.3e-15
Cn1502 n1502 0 6.6e-15
Cn1503 n1503 0 3.3e-15
Cnet1735 net1735 0 3.3e-15
Cn1505 n1505 0 3.3e-15
Cn1506 n1506 0 3.3e-15
Cn1507 n1507 0 3.3e-15
Cn1508 n1508 0 3.3e-15
Cn1509 n1509 0 3.3e-15
Cn1510 n1510 0 3.3e-15
Cn1511 n1511 0 3.3e-15
Cn1512 n1512 0 3.3e-15
Cn1513 n1513 0 3.3e-15
Cn1514 n1514 0 3.3e-15
Cnet2019 net2019 0 6.6e-15
Cn1515 n1515 0 6.6e-15
Cn1316 n1316 0 3.3e-15
Cn1516 n1516 0 6.6e-15
Cn1517 n1517 0 6.6e-15
Cn1518 n1518 0 3.3e-15
Cn1521 n1521 0 3.3e-15
Cn1522 n1522 0 6.6e-15
Cn1523 n1523 0 3.3e-15
Cn1524 n1524 0 3.3e-15
Cn1525 n1525 0 3.3e-15
Cn1526 n1526 0 3.3e-15
Cn1527 n1527 0 3.3e-15
Cn1528 n1528 0 3.3e-15
Cn1529 n1529 0 3.3e-15
Cn1530 n1530 0 3.3e-15
Cn1531 n1531 0 3.3e-15
Cn1532 n1532 0 3.3e-15
Cn1533 n1533 0 3.3e-15
Cn1534 n1534 0 3.3e-15
Cn1535 n1535 0 3.3e-15
Cn1536 n1536 0 3.3e-15
Cn1537 n1537 0 3.3e-15
Cn1538 n1538 0 3.3e-15
Cn1539 n1539 0 3.3e-15
Cn1540 n1540 0 3.3e-15
Cn1541 n1541 0 3.3e-15
Cn1542 n1542 0 3.3e-15
Cn1543 n1543 0 6.6e-15
Cn1544 n1544 0 6.6e-15
Cn1545 n1545 0 3.3e-15
Cn1546 n1546 0 3.3e-15
Cn1547 n1547 0 3.3e-15
Cn1548 n1548 0 3.3e-15
Cn1549 n1549 0 3.3e-15
Cn1550 n1550 0 3.3e-15
Cnet2436 net2436 0 9.9e-15
Cn1551 n1551 0 3.3e-15
Cn1552 n1552 0 3.3e-15
Cn1553 n1553 0 3.3e-15
Cnet2444 net2444 0 3.3e-15
Cn1554 n1554 0 3.3e-15
Cn1555 n1555 0 3.3e-15
Cn1556 n1556 0 3.3e-15
Cn1557 n1557 0 3.3e-15
Cn1558 n1558 0 3.3e-15
Cn1559 n1559 0 3.3e-15
Cn1560 n1560 0 3.3e-15
Cn1561 n1561 0 3.3e-15
Cn1562 n1562 0 6.6e-15
Cn1563 n1563 0 3.3e-15
Cn1564 n1564 0 3.3e-15
Cn1565 n1565 0 3.3e-15
Cnet2498 net2498 0 3.3e-15
Cn1566 n1566 0 3.3e-15
Cn1567 n1567 0 3.3e-15
Cn1568 n1568 0 3.3e-15
Cn1569 n1569 0 3.3e-15
Cn1570 n1570 0 3.3e-15
Cn1571 n1571 0 3.3e-15
Cn1572 n1572 0 3.3e-15
Cn1573 n1573 0 3.3e-15
Cn1574 n1574 0 6.6e-15
Cn1575 n1575 0 3.3e-15
Cnet2550 net2550 0 3.3e-15
Cn1576 n1576 0 3.3e-15
Cn1577 n1577 0 3.3e-15
Cn1578 n1578 0 3.3e-15
Cn1579 n1579 0 3.3e-15
Cn1580 n1580 0 3.3e-15
Cn1581 n1581 0 3.3e-15
Cn1582 n1582 0 3.3e-15
Cn1583 n1583 0 6.6e-15
Cn1584 n1584 0 3.3e-15
Cn1585 n1585 0 3.3e-15
Cn1586 n1586 0 3.3e-15
Cn1587 n1587 0 3.3e-15
Cn1588 n1588 0 3.3e-15
Cn1589 n1589 0 3.3e-15
Cn1590 n1590 0 3.3e-15
Cn1591 n1591 0 3.3e-15
Cn1592 n1592 0 3.3e-15
Cn1593 n1593 0 3.3e-15
Cn1594 n1594 0 3.3e-15
Cn1598 n1598 0 9.9e-15
Cn1601 n1601 0 6.6e-15
Cn1604 n1604 0 6.6e-15

.end
