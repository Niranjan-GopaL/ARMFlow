
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_5_23.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_23_5.v
read_verilog -overwrite ../modules/netlist/NR_16_7.v
read_verilog -overwrite ../modules/netlist/NR_7_16.v
read_verilog -overwrite ../modules/netlist/NR_7_7.v
read_verilog -overwrite ../modules/netlist/NR_28_4.v
read_verilog -overwrite ../modules/netlist/NR_16_16.v
read_verilog -overwrite ../modules/netlist/NR_4_28.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/customAdder23_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder36_3.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v
read_verilog -overwrite ../modules/netlist/customAdder33_4.v
read_verilog -overwrite ../modules/netlist/customAdder28_0.v
read_verilog -overwrite ../modules/netlist/customAdder39_15.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_23.v

hierarchy -check -top multiplier32bit_23

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_23.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
