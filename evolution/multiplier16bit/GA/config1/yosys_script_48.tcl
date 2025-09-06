
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_9_9.v
read_verilog -overwrite ../modules/netlist/NR_4_9.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_9_4.v
read_verilog -overwrite ../modules/netlist/customAdder19_2.v
read_verilog -overwrite ../modules/netlist/customAdder22_8.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_48.v

hierarchy -check -top multiplier16bit_48

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_48.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
