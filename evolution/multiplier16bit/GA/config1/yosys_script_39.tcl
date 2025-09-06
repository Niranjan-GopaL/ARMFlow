
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_10_5.v
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/NR_1_15.v
read_verilog -overwrite ../modules/netlist/NR_9_9.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_15_1.v
read_verilog -overwrite ../modules/netlist/NR_5_10.v
read_verilog -overwrite ../modules/netlist/NR_9_1.v
read_verilog -overwrite ../modules/netlist/NR_1_9.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder25_9.v
read_verilog -overwrite ../modules/netlist/customAdder15_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_0.v
read_verilog -overwrite ../modules/netlist/customAdder31_15.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_39.v

hierarchy -check -top multiplier16bit_39

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_39.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
