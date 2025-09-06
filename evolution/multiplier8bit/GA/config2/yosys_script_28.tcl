
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_4_4.v
read_verilog ../modules/netlist/NR_7_1.v
read_verilog ../modules/netlist/NR_3_4.v
read_verilog ../modules/netlist/NR_4_3.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_7.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/customAdder7_0.v
read_verilog ../modules/netlist/customAdder15_7.v
read_verilog ../modules/netlist/customAdder11_3.v

read_verilog ../evolution/multiplier8bit/GA/config2/multiplier8bit_28.v

hierarchy -check -top multiplier8bit_28

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/GA/config2/multiplier8bit_result_28.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
