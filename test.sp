* Synopsys, Inc. 
.OPTIONS SCALE=1.00e+00
.global vdd gnd
.SUBCKT inv_1 out in
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
.ENDS
.SUBCKT nor2_1 out in0 in1
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-6 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-6 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-6 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-6 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-6 m=3
.ENDS
.SUBCKT nor3_1 out in0 in1
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
.SUBCKT nand2_1 out in0 in1
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
.ENDS
.SUBCKT nand3_1 out in0 in1
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
.ENDS
.SUBCKT nand4_1 out in0 in1
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.42e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-5 m=3
.ENDS
.ENDS
.SUBCKT oai22_1 out in0 in1 in2 in3
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=.945e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=1.445e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=1.445e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=1.445e-5 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=1.445e-5 m=3
.ENDS
.SUBCKT oai21_1 out in0 in1 in2
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.945e-5 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=1.445e-5 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=1.445e-5 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=1.445e-5 m=3
.ENDS
.SUBCKT aoi22_1 out in0 in1 in2 in3
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=2.835e-6 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=2.835e-6 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=2.835e-6 m=3
mxn3  node3 in2 gnd   gnd nmos4 l=2e-07 w=2.835e-6 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=4.335e-6 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=4.335e-6 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=4.335e-6 m=3
mxp3  out   in2 vdd   vdd pmos4 l-2e-07 w=4.335e-6 m=3
.ENDS
.SUBCKT aoi21_1 out in0 in1 in2
mxn0  out   in0 node1 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxn1  node1 in1 node2 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxn2  node2 in2 node3 gnd nmos4 l=2e-07 w=.42e-6 m=3
mxp0  out   in0 vdd   vdd pmos4 l=2e-07 w=.42e-6 m=3
mxp1  out   in1 vdd   vdd pmos4 l-2e-07 w=.42e-6 m=3
mxp2  out   in2 vdd   vdd pmos4 l-2e-07 w=.42e-6 m=3
.ENDS
.SUBCKT xor2_1 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=4.335e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=2.835e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=2.835e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=2.835e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=2.835e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=2.835e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=4.335e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=4.335e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=4.335e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=4.335e-6 
.ENDS
.SUBCKT xor2_2 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1.89e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.89e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.89e-6 
.ENDS
.SUBCKT xor2_3 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=.42e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1.89e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=.42e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=.42e-6 
.ENDS
.SUBCKT xor2_4 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=.42e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=2.89e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.89e-6 
.ENDS
.SUBCKT xor2_5 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=.42e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=.42e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=.42e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=.42e-6 
.ENDS
.SUBCKT xor2_6 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=.42e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=.42e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=2.89e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=2.89e-6 
.ENDS
.SUBCKT xor2_7 out in0 in1 in2
mxm0  out in0 intd vdd  pmos4 l=2e-07 w=.42e-6 
mxm1  intb in1 gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm7  inta in0 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm8  inta in1 gnd gnd  nmos4 l=2e-07 w=.42e-6 
mxm3  out inta gnd gnd  nmos4 l=2e-07 w=1.89e-6 
mxm2  out in0 intb gnd  nmos4 l=2e-07 w=1.89e-6 
mxm10  inta in0 intc vdd  pmos4 l=2e-07 w=.42e-6 
mxm6  intd inta vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm9  intc in1 vdd vdd  pmos4 l=2e-07 w=.42e-6 
mxm4  out in1 intd vdd  pmos4 l=2e-07 w=.42e-6 
.ENDS

