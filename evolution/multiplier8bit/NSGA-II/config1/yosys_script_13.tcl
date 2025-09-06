
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_6_2.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_2_6.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_5.v

read_verilog -overwrite ../circuits/multiplier8bit/NSGA-II/config1/multiplier8bit_13.v

hierarchy -check -top multiplier8bit_13

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_result_13.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
