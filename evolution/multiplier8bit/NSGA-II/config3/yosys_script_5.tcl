
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog ../modules/netlist/NR_5_3.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_3_5.v
read_verilog ../modules/netlist/customAdder13_4.v
read_verilog ../modules/netlist/customAdder8_0.v

read_verilog ../evolution/multiplier8bit/NSGA-II/config3/multiplier8bit_5.v

hierarchy -check -top multiplier8bit_5

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/NSGA-II/config3/multiplier8bit_result_5.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
