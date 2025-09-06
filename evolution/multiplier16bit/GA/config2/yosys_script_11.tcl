
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_10_10.v
read_verilog -overwrite ../modules/netlist/NR_10_6.v
read_verilog -overwrite ../modules/netlist/NR_6_10.v
read_verilog -overwrite ../modules/netlist/customAdder22_5.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config2/multiplier16bit_11.v

hierarchy -check -top multiplier16bit_11

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_11.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
