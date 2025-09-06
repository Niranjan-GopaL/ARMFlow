
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_7_1.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_1_7.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_1.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v

read_verilog -overwrite ../circuits/multiplier8bit/NSGA-II/config1/multiplier8bit_26.v

hierarchy -check -top multiplier8bit_26

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_result_26.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
