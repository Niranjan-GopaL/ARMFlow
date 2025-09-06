
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_2_4.v
read_verilog ../modules/netlist/NR_6_2.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_4_2.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_2_6.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder8_1.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder14_5.v

read_verilog ../evolution/multiplier8bit/GA/config4/multiplier8bit_41.v

hierarchy -check -top multiplier8bit_41

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/GA/config4/multiplier8bit_result_41.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
