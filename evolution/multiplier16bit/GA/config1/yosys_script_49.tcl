
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_2_14.v
read_verilog -overwrite ../modules/netlist/NR_12_12.v
read_verilog -overwrite ../modules/netlist/NR_12_2.v
read_verilog -overwrite ../modules/netlist/NR_2_12.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_14_2.v
read_verilog -overwrite ../modules/netlist/customAdder30_13.v
read_verilog -overwrite ../modules/netlist/customAdder26_11.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_0.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_49.v

hierarchy -check -top multiplier16bit_49

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_49.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
