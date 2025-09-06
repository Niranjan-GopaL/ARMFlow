
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_2_3.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_5_3.v
read_verilog ../modules/netlist/NR_3_2.v
read_verilog ../modules/netlist/NR_3_5.v
read_verilog ../modules/netlist/customAdder7_1.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder11_2.v
read_verilog ../modules/netlist/customAdder5_0.v

read_verilog ../evolution/multiplier8bit/GA/config1/multiplier8bit_21.v

hierarchy -check -top multiplier8bit_21

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/GA/config1/multiplier8bit_result_21.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
