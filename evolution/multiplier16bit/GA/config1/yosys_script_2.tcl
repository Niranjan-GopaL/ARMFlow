
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_2_14.v
read_verilog -overwrite ../modules/netlist/NR_14_2.v
read_verilog -overwrite ../modules/netlist/NR_14_14.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/customAdder30_13.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_2.v

hierarchy -check -top multiplier16bit_2

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_2.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
