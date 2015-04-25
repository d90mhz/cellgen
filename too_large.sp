* Synopsys, Inc. 
.OPTIONS SCALE=1.00e+00
.global vdd gnd
.SUBCKT invload out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06 m=3
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06 m=3
.ENDS
.SUBCKT nand2_1 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_1 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_1 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT inv1x_2 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_3 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_1 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_2 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand2_2 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT inv1x_4 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT inv1x_5 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand4_1 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=3.5e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=3.5e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand3_1 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=6.3e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=3.5e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=6.3e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=6.3e-06
.ENDS
.SUBCKT nand3_2 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_6 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT inv1x_7 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT inv1x_8 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_9 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT inv1x_10 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=5.6e-06
.ENDS
.SUBCKT aoi21_1 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand2_3 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand3_3 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_4 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT aoi21_2 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT nand2_5 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_6 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT aoi21_3 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT inv1x_11 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=5.6e-06
.ENDS
.SUBCKT nand2_7 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=5.6e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=5.6e-06
.ENDS
.SUBCKT inv1x_12 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nand2_8 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=6.3e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=6.3e-06
.ENDS
.SUBCKT nand4_2 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.8e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=2.8e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_2 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai22_1 out in0 in1 in2 in3
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intn vdd  pmos4 l=2e-07 w=2.8e-06
mxn3  out in3 inta gnd  nmos4 l=2e-07 w=1e-06
mxp3  intn in3 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand3_4 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT inv1x_13 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand4_3 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT oai21_3 out in0 in1 in2
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_9 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_4 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT aoi21_5 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.8e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=8.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=8.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=2.8e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=8.4e-06
.ENDS
.SUBCKT oai22_2 out in0 in1 in2 in3
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=4.9e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=3.5e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=3.5e-06
mxp2  out in2 intn vdd  pmos4 l=2e-07 w=4.9e-06
mxn3  out in3 inta gnd  nmos4 l=2e-07 w=3.5e-06
mxp3  intn in3 vdd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT aoi21_6 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nor2_3 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT aoi22_1 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 intb gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  intb in3 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp3  out in3 intm vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nand2_10 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand3_5 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor3_1 out in0 in1 in2
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=5.6e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 intn vdd  pmos4 l=2e-07 w=5.6e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  intn in2 vdd vdd  pmos4 l=2e-07 w=5.6e-06
.ENDS
.SUBCKT nand3_6 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand3_7 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nor3_2 out in0 in1 in2
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 intn vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  intn in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT aoi21_7 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT aoi21_8 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT inv1x_14 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT nand3_8 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=4.9e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=4.9e-06
.ENDS
.SUBCKT nand2_11 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nand2_12 out in0 in1
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=4.2e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=4.2e-06
.ENDS
.SUBCKT oai22_3 out in0 in1 in2 in3
mxn0  inta in0 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  out in2 inta gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intn vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  out in3 inta gnd  nmos4 l=2e-07 w=1e-06
mxp3  intn in3 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
.SUBCKT nor2_4 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nor2_5 out in0 in1
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 intm vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  out in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT aoi21_9 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=3.5e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT aoi21_10 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  intm in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  intm in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  out in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 intm vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT inv1x_15 out in0
mxn0  out in0 gnd gnd  nmos4 l=2e-07 w=2.1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=3.5e-06
.ENDS
.SUBCKT nand3_9 out in0 in1 in2
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.8e-06
mxn2  intb in2 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.8e-06
.ENDS
.SUBCKT nand4_4 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=2.1e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=2.1e-06
.ENDS
.SUBCKT nand4_5 out in0 in1 in2 in3
mxn0  out in0 inta gnd  nmos4 l=2e-07 w=1.4e-06
mxp0  out in0 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn1  inta in1 intb gnd  nmos4 l=2e-07 w=1.4e-06
mxp1  out in1 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn2  intb in2 intc gnd  nmos4 l=2e-07 w=1.4e-06
mxp2  out in2 vdd vdd  pmos4 l=2e-07 w=1.4e-06
mxn3  intc in3 gnd gnd  nmos4 l=2e-07 w=1.4e-06
mxp3  out in3 vdd vdd  pmos4 l=2e-07 w=1.4e-06
.ENDS
Xld0 prout0 n0  invload
Xld1 prout1 o0  invload
Xld2 prout2 p0  invload
Xg1 net820 net801 net934  nand2_1
Xg2 net819 net820 net821  nand2_1
Xg3 net934 net931 net731 net745  oai21_1
Xg4 net830 net731  inv1x_1
Xg5 net931 net741  inv1x_2
Xg6 net3006 net931  inv1x_3
Xg7 net801 net754 n405  nor2_1
Xg8 n405 n406  inv1x_2
Xg9 net825 net754 n405  nor2_2
Xg10 n406 net673 net680  nand2_2
Xg11 net680 d0  inv1x_4
Xg12 net754 net723  inv1x_5
Xg13 net745 net891 w net800 n407  nand4_1
Xg14 net742 net743 net744 net745  nand3_1
Xg15 n407 net659 net966 net981  nand3_2
Xg16 net981 net875  inv1x_5
Xg17 net875 net2984  inv1x_6
Xg18 net920 net873 net875 net705  oai21_1
Xg19 net966 net873  inv1x_7
Xg20 net873 net733  inv1x_8
Xg21 net945 net873 net705  nand2_2
Xg22 net659 net958  inv1x_9
Xg23 net958 net1654  inv1x_10
Xg24 net642 net958 net852 net671  aoi21_1
Xg25 net917 net958 net697  nand2_3
Xg26 net757 net958 net926 net693  nand3_3
Xg27 net800 net685 net680  nor2_2
Xg28 net891 net729  inv1x_4
Xg29 net731 net1687 net730  nand2_4
Xg30 net646 net799 net822 net819  aoi21_2
Xg31 net821 v net779  nand2_5
Xg32 net783 net821  inv1x_2
Xg33 net779 net688  inv1x_8
Xg34 net2984 j0 net2949  nand2_6
Xg35 net2994 net2956 net2984 net2995  aoi21_3
Xg36 net2959 net2984 net2956  nand2_4
Xg37 net2949 i0  inv1x_9
Xg38 net1636 net1592 net2949  nand2_4
Xg39 net733 net1620 i0  nand2_5
Xg40 net986 net733  inv1x_3
Xg41 net1620 y  inv1x_11
Xg42 net1654 net1655 net1666  nand2_7
Xg43 net684 net1654 c0  nor2_2
Xg44 net1666 y  inv1x_12
Xg45 net1655 a0  inv1x_12
Xg46 net907 a0 net697  nand2_5
Xg47 o0 net645 net646  nand2_8
Xg48 net822 net927 net866 net928 n409  nand4_2
Xg49 n409 net797 net964 net755  aoi21_3
Xg50 net755 net693 net756 net757  oai21_1
Xg51 net693 u  inv1x_3
Xg52 net738 net691 net693  nand2_2
Xg53 net797 net693 net673 net911  oai21_2
Xg54 net926 net680 net718 net793 net794  oai22_1
Xg55 net794 l0 net791 net795  nand3_4
Xg56 net793 net704 n408 net652  nand3_4
Xg57 n408 a  inv1x_2
Xg58 net841 v n408  nor2_1
Xg59 net704 e0  inv1x_5
Xg60 net960 net704  inv1x_2
Xg61 net970 net702 net703 net704  nand3_4
Xg62 net653 w  inv1x_2
Xg63 net689 w net685  nor2_2
Xg64 net763 w net659  nor2_1
Xg65 net956 net731  inv1x_2
Xg66 net730 c0  inv1x_5
Xg67 net897 net732 net730 net894  nand3_4
Xg68 net729 net683 net730  nand2_4
Xg69 net758 net730 net674  nand2_1
Xg70 net1687 net701  inv1x_13
Xg71 n410 k n512 n508 net674  nand4_3
Xg72 net896 i0 net699 net2956  oai21_3
Xg73 net936 v net2959  nand2_9
Xg74 net756 net2959 net853  nand2_2
Xg75 net2956 i0 net1620  nand2_4
Xg76 net776 net2959  inv1x_5
Xg77 net2995 net680  inv1x_2
Xg78 net924 net2994  inv1x_5
Xg79 net2857 net2998  inv1x_4
Xg80 net2998 net680  inv1x_8
Xg81 net777 net2956 net732 net1678  aoi21_4
Xg82 n0 net641 net642 net643  aoi21_5
Xg83 net643 net742 n422 net742 n420  oai22_2
Xg84 n420 n419  inv1x_9
Xg85 n419 net829 net830 n418  aoi21_6
Xg86 n418 n416 net729 net827  oai21_3
Xg87 n416 net687  inv1x_13
Xg88 net759 n416 net758  nor2_3
Xg89 net829 net739  inv1x_2
Xg90 n422 n417 n421  nand2_5
Xg91 n421 net830 net2857 n415 net830  aoi22_1
Xg92 n415 n413  inv1x_2
Xg93 net739 n415 net741  nand2_10
Xg94 n413 n414 net738 d0  nand3_5
Xg95 net691 v  inv1x_2
Xg96 net843 net791 net691  nand2_2
Xg97 n414 n411 n412 v  oai21_3
Xg98 n412 h0  inv1x_3
Xg99 n411 o z  nor2_1
Xg100 n417 net686  inv1x_3
Xg101 net813 d0 n417  nor2_1
Xg102 net671 net672 net673  nor2_1
Xg103 net672 net867  inv1x_3
Xg104 net641 net742 n423 n428  nor3_1
Xg105 n428 n429 net739 n430  nand3_4
Xg106 n430 n426 n432 n433  nand3_6
Xg107 n433 net936 net659 net924  nand3_3
Xg108 n432 j n431  nand2_2
Xg109 n431 k net648  nand2_2
Xg110 n426 net705 net703  nor2_1
Xg111 net703 f0  inv1x_9
Xg112 net701 net702 net703 net979  nand3_7
Xg113 net705 h  inv1x_5
Xg114 net865 net697 net705 net1592  nand3_4
Xg115 n429 n427 n425  nand2_2
Xg116 n425 net682  inv1x_5
Xg117 net688 net689 n425  nand2_4
Xg118 n427 net718 v m  nor3_2
Xg119 net718 c  inv1x_2
Xg120 net952 net845 net944 net718  nand3_4
Xg121 n423 net668 net669 n424  aoi21_7
Xg122 n424 k0 net2857 net791  nand3_5
Xg123 net795 h j0  nand2_2
Xg124 net728 h f0  nand2_1
Xg125 net836 n434 net728  nand2_10
Xg126 n434 h j0  nand2_4
Xg127 net1685 net774  inv1x_3
Xg128 net1681 net659  inv1x_8
Xg129 net1682 net1681  inv1x_8
Xg130 net1678 x  inv1x_2
Xg131 n435 n410 net709  nand2_1
Xg132 net788 net1592 net1668  nor2_1
Xg133 net664 net1620 net907  nand2_2
Xg134 net894 net1636 n436  nand2_9
Xg135 net741 net917 net1636 n436  nand3_7
Xg136 n436 i0 net1620 net679  nand3_4
Xg137 net1668 net1620  inv1x_3
Xg138 net1592 net1671  inv1x_9
Xg139 net1671 j0  inv1x_5
Xg140 net949 net830 net797 net3006  nand3_5
Xg141 net669 net748 net946 net904  nand3_3
Xg142 net904 n435  inv1x_8
Xg143 n437 n505 n504  nand2_3
Xg144 net979 e0  inv1x_2
Xg145 n438 net693 net688 net744  oai21_3
Xg146 n440 n491 n439  nand2_2
Xg147 n439 n488  inv1x_3
Xg148 n441 n440  inv1x_2
Xg149 net968 net836  inv1x_8
Xg150 net964 net776  inv1x_8
Xg151 net961 net960  inv1x_5
Xg152 p0 n442 n443 c0  aoi21_8
Xg153 n444 k net648 n445  aoi21_4
Xg154 n446 v u  nor2_1
Xg155 n447 net652 net653  nor2_1
Xg156 n448 b net655  nor2_1
Xg157 n449 n450 n451 net1682  aoi21_7
Xg158 n452 net659 n453  nor2_2
Xg159 n454 net664 net1636 n527  aoi21_4
Xg160 net674 n  inv1x_14
Xg161 net676 n455 n456 net679  nand3_8
Xg162 net682 d0 net683 net684  nand3_2
Xg163 net685 net686 net687  nand2_4
Xg164 net697 i0  inv1x_5
Xg165 net699 j0  inv1x_2
Xg166 net652 h0 o  nand2_10
Xg167 net707 k  inv1x_3
Xg168 net709 j  inv1x_2
Xg169 net702 g0  inv1x_5
Xg170 n457 m0  inv1x_3
Xg171 net655 n458 n459  nand2_11
Xg172 net723 d0 net653  nand2_1
Xg173 net679 x  inv1x_1
Xg174 n453 net970 n460  nand2_9
Xg175 net673 z h0  nand2_1
Xg176 n461 b  inv1x_3
Xg177 net686 n o  nand2_12
Xg178 n462 n463 net748  nand2_4
Xg179 net749 n464 net709  nand2_2
Xg180 n465 n446 net723 net754 n453  oai22_3
Xg181 n466 d0 net652  nor2_2
Xg182 n445 j net699  nand2_2
Xg183 n459 c f  nor2_4
Xg184 n458 e g  nor2_5
Xg185 n467 n448 net961  nor2_1
Xg186 n468 net765 net766  nor2_1
Xg187 n469 n444 net968 n468  oai21_3
Xg188 n470 n467 n471 n457  aoi21_7
Xg189 n472 n473 n474 n469  aoi21_7
Xg190 n475 net686 net687  nand2_2
Xg191 n450 x net970 net774  aoi21_4
Xg192 n476 net754 net776  nor2_2
Xg193 n442 net783 n438  nor2_2
Xg194 n443 n472 n470 n477  aoi21_9
Xg195 n478 net777 n476 n452  aoi21_1
Xg196 n477 n479 n480 n478  nand3_4
Xg197 n481 net961 net2857 net652  nand3_3
Xg198 n482 l0 net791  nand2_2
Xg199 n483 n481 n482  nor2_2
Xg200 net799 net729 net685  nor2_1
Xg201 n484 net707 n461  nor2_2
Xg202 n485 b j r  aoi21_4
Xg203 n486 a u  nor2_1
Xg204 n487 f e  nor2_1
Xg205 n488 n487 n486  nand2_2
Xg206 n489 net686 n490  nand2_2
Xg207 n491 n489 net682  nor2_2
Xg208 n492 net729 net655  nor2_1
Xg209 n493 net791 net1685  nand2_2
Xg210 n494 n495 n493  nor2_1
Xg211 n495 l0 n434  nand2_2
Xg212 net645 n496 n494 net824  aoi21_10
Xg213 n463 net836 n497  nor2_2
Xg214 net668 n498 n499 n454  aoi21_4
Xg215 n500 j net655  nor2_2
Xg216 n501 k0 n434  nand2_2
Xg217 net845 n501 net843  nor2_1
Xg218 n502 v net2857  nor2_2
Xg219 n503 net841 d0 net774  aoi21_7
Xg220 n504 l  inv1x_6
Xg221 n505 t  inv1x_3
Xg222 n506 s  inv1x_6
Xg223 n455 b0  inv1x_15
Xg224 n456 q  inv1x_15
Xg225 n490 g  inv1x_3
Xg226 net866 net853 net867  nand2_2
Xg227 net827 net956 net2857 n507  nand3_9
Xg228 n498 n462  inv1x_3
Xg229 net687 m r  nand2_11
Xg230 net732 net701  inv1x_2
Xg231 n460 n456 n455 net687 net686  nand4_4
Xg232 n508 n505 n504  nand2_2
Xg233 net648 n437 net674 n517  nand3_4
Xg234 net774 net652  inv1x_2
Xg235 net683 net676  inv1x_9
Xg236 n451 net676 n475 net754  oai21_3
Xg237 net748 net655  inv1x_6
Xg238 net791 i g0  nand2_11
Xg239 net766 net791  inv1x_3
Xg240 net765 net673  inv1x_3
Xg241 n509 net683 net896 net759  nand3_4
Xg242 n510 net897 n509  nand2_10
Xg243 net744 n466 n510  nand2_6
Xg244 n511 b m  nand2_2
Xg245 n497 n511  inv1x_3
Xg246 n464 k n512 n508 net674  nand4_5
Xg247 n513 m n435  nand2_2
Xg248 n471 net748 n513  nand2_2
Xg249 n499 net664 net865  nand2_9
Xg250 n514 m net749  nand2_2
Xg251 n515 c n514  nand2_2
Xg252 n474 net763 n515  nand2_2
Xg253 n480 n449  inv1x_3
Xg254 n479 n447 n465 net964  oai21_2
Xg255 net911 v d0  nand2_2
Xg256 n516 n437 net674 n484 n517  nand4_3
Xg257 n518 n485 n516  nand2_1
Xg258 n519 m n518  nand2_1
Xg259 n520 net986 net1678  nand2_2
Xg260 n507 net917 net865 n520  nand3_6
Xg261 n521 net788 net907  nand2_9
Xg262 n522 net920 n521  nand2_1
Xg263 n523 n441 n519  nand2_2
Xg264 n524 n492 n522 net813 n519  nand4_3
Xg265 n496 n523 net827 n524  nand3_4
Xg266 net867 net1682 net924  nand2_4
Xg267 net927 n483 n522  nand2_1
Xg268 net928 net765 net867  nand2_1
Xg269 net743 net830 net825 net741  nand3_2
Xg270 n525 n500 n526  nand2_1
Xg271 n527 net968 net961  nand2_10
Xg272 net944 n527 n462 n525  nand3_4
Xg273 net946 n521 net865 net945  nand3_5
Xg274 net853 net728  inv1x_2
Xg275 n473 n499 net2857  nand2_2
Xg276 n517 d n506  nand2_9
Xg277 net824 net949  inv1x_3
Xg278 n512 d n506  nand2_4
Xg279 n526 k n512 n437 net674  nand4_5
Xg280 net852 n528 net952 n503  nand3_4
Xg281 n528 n502 net904 c  nand3_5
Ca a 0 3.3e-15
Cb b 0 9.9e-15
Cc c 0 9.9e-15
Cd d 0 3.3e-15
Ce e 0 3.3e-15
Cf f 0 3.3e-15
Cg g 0 3.3e-15
Ch h 0 9.9e-15
Cj j 0 1.32e-14
Ck k 0 1.65e-14
Cm m 0 1.65e-14
Cn n 0 3.3e-15
Co o 0 6.6e-15
Cr r 0 3.3e-15
Cu u 0 6.6e-15
Cv v 0 2.64e-14
Cw w 0 9.9e-15
Cx x 0 6.6e-15
Cy y 0 3.3e-15
Cz z 0 3.3e-15
Ca0 a0 0 3.3e-15
Cc0 c0 0 6.6e-15
Cd0 d0 0 2.31e-14
Ce0 e0 0 3.3e-15
Cf0 f0 0 3.3e-15
Cg0 g0 0 3.3e-15
Ch0 h0 0 6.6e-15
Ci0 i0 0 1.65e-14
Cj0 j0 0 1.32e-14
Ck0 k0 0 3.3e-15
Cl0 l0 0 6.6e-15
Cnet820 net820 0 3.3e-15
Cnet801 net801 0 3.3e-15
Cnet934 net934 0 3.3e-15
Cnet819 net819 0 3.3e-15
Cnet821 net821 0 6.6e-15
Cnet931 net931 0 6.6e-15
Cnet731 net731 0 9.9e-15
Cnet745 net745 0 6.6e-15
Cnet830 net830 0 1.65e-14
Cnet741 net741 0 9.9e-15
Cnet3006 net3006 0 3.3e-15
Cnet754 net754 0 1.65e-14
Cn405 n405 0 6.6e-15
Cn406 n406 0 3.3e-15
Cnet825 net825 0 3.3e-15
Cnet673 net673 0 1.32e-14
Cnet680 net680 0 1.65e-14
Cnet723 net723 0 6.6e-15
Cnet891 net891 0 3.3e-15
Cnet800 net800 0 3.3e-15
Cn407 n407 0 3.3e-15
Cnet742 net742 0 9.9e-15
Cnet743 net743 0 3.3e-15
Cnet744 net744 0 6.6e-15
Cnet659 net659 0 1.65e-14
Cnet966 net966 0 3.3e-15
Cnet981 net981 0 3.3e-15
Cnet875 net875 0 6.6e-15
Cnet2984 net2984 0 9.9e-15
Cnet920 net920 0 3.3e-15
Cnet873 net873 0 9.9e-15
Cnet705 net705 0 1.32e-14
Cnet733 net733 0 6.6e-15
Cnet945 net945 0 3.3e-15
Cnet958 net958 0 1.32e-14
Cnet1654 net1654 0 6.6e-15
Cnet642 net642 0 3.3e-15
Cnet852 net852 0 3.3e-15
Cnet671 net671 0 3.3e-15
Cnet917 net917 0 6.6e-15
Cnet697 net697 0 9.9e-15
Cnet757 net757 0 3.3e-15
Cnet926 net926 0 3.3e-15
Cnet693 net693 0 1.65e-14
Cnet685 net685 0 9.9e-15
Cnet729 net729 0 1.32e-14
Cnet1687 net1687 0 3.3e-15
Cnet730 net730 0 1.32e-14
Cnet646 net646 0 3.3e-15
Cnet799 net799 0 3.3e-15
Cnet822 net822 0 3.3e-15
Cnet779 net779 0 3.3e-15
Cnet783 net783 0 3.3e-15
Cnet688 net688 0 6.6e-15
Cnet2949 net2949 0 6.6e-15
Cnet2994 net2994 0 3.3e-15
Cnet2956 net2956 0 1.32e-14
Cnet2995 net2995 0 3.3e-15
Cnet2959 net2959 0 9.9e-15
Cnet1636 net1636 0 9.9e-15
Cnet1592 net1592 0 9.9e-15
Cnet1620 net1620 0 1.65e-14
Cnet986 net986 0 3.3e-15
Cnet1655 net1655 0 3.3e-15
Cnet1666 net1666 0 3.3e-15
Cnet684 net684 0 3.3e-15
Cnet907 net907 0 6.6e-15
Cnet645 net645 0 3.3e-15
Cnet927 net927 0 3.3e-15
Cnet866 net866 0 3.3e-15
Cnet928 net928 0 3.3e-15
Cn409 n409 0 3.3e-15
Cnet797 net797 0 6.6e-15
Cnet964 net964 0 6.6e-15
Cnet755 net755 0 3.3e-15
Cnet756 net756 0 3.3e-15
Cnet738 net738 0 3.3e-15
Cnet691 net691 0 6.6e-15
Cnet911 net911 0 3.3e-15
Cnet718 net718 0 9.9e-15
Cnet793 net793 0 3.3e-15
Cnet794 net794 0 3.3e-15
Cnet791 net791 0 1.98e-14
Cnet795 net795 0 3.3e-15
Cnet704 net704 0 9.9e-15
Cn408 n408 0 6.6e-15
Cnet652 net652 0 1.65e-14
Cnet841 net841 0 3.3e-15
Cnet960 net960 0 3.3e-15
Cnet970 net970 0 6.6e-15
Cnet702 net702 0 6.6e-15
Cnet703 net703 0 9.9e-15
Cnet653 net653 0 6.6e-15
Cnet689 net689 0 3.3e-15
Cnet763 net763 0 3.3e-15
Cnet956 net956 0 3.3e-15
Cnet897 net897 0 3.3e-15
Cnet732 net732 0 6.6e-15
Cnet894 net894 0 3.3e-15
Cnet683 net683 0 9.9e-15
Cnet758 net758 0 3.3e-15
Cnet674 net674 0 1.98e-14
Cnet701 net701 0 6.6e-15
Cn410 n410 0 3.3e-15
Cn512 n512 0 9.9e-15
Cn508 n508 0 6.6e-15
Cnet896 net896 0 3.3e-15
Cnet699 net699 0 6.6e-15
Cnet936 net936 0 3.3e-15
Cnet853 net853 0 6.6e-15
Cnet776 net776 0 6.6e-15
Cnet924 net924 0 6.6e-15
Cnet2857 net2857 0 1.98e-14
Cnet2998 net2998 0 3.3e-15
Cnet777 net777 0 3.3e-15
Cnet1678 net1678 0 6.6e-15
Cnet641 net641 0 3.3e-15
Cnet643 net643 0 3.3e-15
Cn422 n422 0 3.3e-15
Cn420 n420 0 3.3e-15
Cn419 n419 0 3.3e-15
Cnet829 net829 0 3.3e-15
Cn418 n418 0 3.3e-15
Cn416 n416 0 6.6e-15
Cnet827 net827 0 6.6e-15
Cnet687 net687 0 1.32e-14
Cnet759 net759 0 3.3e-15
Cnet739 net739 0 6.6e-15
Cn417 n417 0 6.6e-15
Cn421 n421 0 3.3e-15
Cn415 n415 0 6.6e-15
Cn413 n413 0 3.3e-15
Cn414 n414 0 3.3e-15
Cnet843 net843 0 3.3e-15
Cn411 n411 0 3.3e-15
Cn412 n412 0 3.3e-15
Cnet686 net686 0 1.65e-14
Cnet813 net813 0 3.3e-15
Cnet672 net672 0 3.3e-15
Cnet867 net867 0 9.9e-15
Cn423 n423 0 3.3e-15
Cn428 n428 0 3.3e-15
Cn429 n429 0 3.3e-15
Cn430 n430 0 3.3e-15
Cn426 n426 0 3.3e-15
Cn432 n432 0 3.3e-15
Cn433 n433 0 3.3e-15
Cn431 n431 0 3.3e-15
Cnet648 net648 0 6.6e-15
Cnet979 net979 0 3.3e-15
Cnet865 net865 0 9.9e-15
Cn427 n427 0 3.3e-15
Cn425 n425 0 6.6e-15
Cnet682 net682 0 6.6e-15
Cnet952 net952 0 3.3e-15
Cnet845 net845 0 3.3e-15
Cnet944 net944 0 3.3e-15
Cnet668 net668 0 3.3e-15
Cnet669 net669 0 3.3e-15
Cn424 n424 0 3.3e-15
Cnet728 net728 0 6.6e-15
Cnet836 net836 0 6.6e-15
Cn434 n434 0 9.9e-15
Cnet1685 net1685 0 3.3e-15
Cnet774 net774 0 9.9e-15
Cnet1681 net1681 0 3.3e-15
Cnet1682 net1682 0 6.6e-15
Cn435 n435 0 6.6e-15
Cnet709 net709 0 6.6e-15
Cnet788 net788 0 3.3e-15
Cnet1668 net1668 0 3.3e-15
Cnet664 net664 0 6.6e-15
Cn436 n436 0 6.6e-15
Cnet679 net679 0 6.6e-15
Cnet1671 net1671 0 3.3e-15
Cnet949 net949 0 3.3e-15
Cnet748 net748 0 9.9e-15
Cnet946 net946 0 3.3e-15
Cnet904 net904 0 6.6e-15
Cn437 n437 0 9.9e-15
Cn505 n505 0 6.6e-15
Cn504 n504 0 6.6e-15
Cn438 n438 0 3.3e-15
Cn440 n440 0 3.3e-15
Cn491 n491 0 3.3e-15
Cn439 n439 0 3.3e-15
Cn488 n488 0 3.3e-15
Cn441 n441 0 3.3e-15
Cnet968 net968 0 6.6e-15
Cnet961 net961 0 9.9e-15
Cn442 n442 0 3.3e-15
Cn443 n443 0 3.3e-15
Cn444 n444 0 3.3e-15
Cn445 n445 0 3.3e-15
Cn446 n446 0 3.3e-15
Cn447 n447 0 3.3e-15
Cn448 n448 0 3.3e-15
Cnet655 net655 0 1.32e-14
Cn449 n449 0 3.3e-15
Cn450 n450 0 3.3e-15
Cn451 n451 0 3.3e-15
Cn452 n452 0 3.3e-15
Cn453 n453 0 6.6e-15
Cn454 n454 0 3.3e-15
Cn527 n527 0 6.6e-15
Cnet676 net676 0 6.6e-15
Cn455 n455 0 6.6e-15
Cn456 n456 0 6.6e-15
Cnet707 net707 0 3.3e-15
Cn457 n457 0 3.3e-15
Cn458 n458 0 3.3e-15
Cn459 n459 0 3.3e-15
Cn460 n460 0 3.3e-15
Cn461 n461 0 3.3e-15
Cn462 n462 0 6.6e-15
Cn463 n463 0 3.3e-15
Cnet749 net749 0 3.3e-15
Cn464 n464 0 3.3e-15
Cn465 n465 0 3.3e-15
Cn466 n466 0 3.3e-15
Cn467 n467 0 3.3e-15
Cn468 n468 0 3.3e-15
Cnet765 net765 0 6.6e-15
Cnet766 net766 0 3.3e-15
Cn469 n469 0 3.3e-15
Cn470 n470 0 3.3e-15
Cn471 n471 0 3.3e-15
Cn472 n472 0 3.3e-15
Cn473 n473 0 3.3e-15
Cn474 n474 0 3.3e-15
Cn475 n475 0 3.3e-15
Cn476 n476 0 3.3e-15
Cn477 n477 0 3.3e-15
Cn478 n478 0 3.3e-15
Cn479 n479 0 3.3e-15
Cn480 n480 0 3.3e-15
Cn481 n481 0 3.3e-15
Cn482 n482 0 3.3e-15
Cn483 n483 0 3.3e-15
Cn484 n484 0 3.3e-15
Cn485 n485 0 3.3e-15
Cn486 n486 0 3.3e-15
Cn487 n487 0 3.3e-15
Cn489 n489 0 3.3e-15
Cn490 n490 0 3.3e-15
Cn492 n492 0 3.3e-15
Cn493 n493 0 3.3e-15
Cn494 n494 0 3.3e-15
Cn495 n495 0 3.3e-15
Cn496 n496 0 3.3e-15
Cnet824 net824 0 3.3e-15
Cn497 n497 0 3.3e-15
Cn498 n498 0 3.3e-15
Cn499 n499 0 6.6e-15
Cn500 n500 0 3.3e-15
Cn501 n501 0 3.3e-15
Cn502 n502 0 3.3e-15
Cn503 n503 0 3.3e-15
Cn506 n506 0 6.6e-15
Cn507 n507 0 3.3e-15
Cn517 n517 0 6.6e-15
Cn509 n509 0 3.3e-15
Cn510 n510 0 3.3e-15
Cn511 n511 0 3.3e-15
Cn513 n513 0 3.3e-15
Cn514 n514 0 3.3e-15
Cn515 n515 0 3.3e-15
Cn516 n516 0 3.3e-15
Cn518 n518 0 3.3e-15
Cn519 n519 0 6.6e-15
Cn520 n520 0 3.3e-15
Cn521 n521 0 6.6e-15
Cn522 n522 0 6.6e-15
Cn523 n523 0 3.3e-15
Cn524 n524 0 3.3e-15
Cn525 n525 0 3.3e-15
Cn526 n526 0 3.3e-15
Cn528 n528 0 3.3e-15

.end
