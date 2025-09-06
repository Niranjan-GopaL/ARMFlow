
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_7_1.v
read_verilog ../modules/netlist/NR_7_7.v
read_verilog ../modules/netlist/NR_1_7.v
read_verilog ../modules/netlist/customAdder7_0.v
read_verilog ../modules/netlist/customAdder8_0.v

read_verilog ../evolution/multiplier8bit/GA/config4/multiplier8bit_5.v

hierarchy -check -top multiplier8bit_5

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/GA/config4/multiplier8bit_result_5.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
