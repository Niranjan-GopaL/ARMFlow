
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_6_2.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_2_6.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder10_1.v
read_verilog ../modules/netlist/customAdder9_2.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder5_2.v

read_verilog ../evolution/multiplier8bit/GA/config2/multiplier8bit_29.v

hierarchy -check -top multiplier8bit_29

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/GA/config2/multiplier8bit_result_29.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
