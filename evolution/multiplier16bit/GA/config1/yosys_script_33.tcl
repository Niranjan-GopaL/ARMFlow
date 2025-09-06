
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_12.v
read_verilog -overwrite ../modules/netlist/NR_12_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_12_12.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/customAdder19_2.v
read_verilog -overwrite ../modules/netlist/customAdder12_0.v
read_verilog -overwrite ../modules/netlist/customAdder25_12.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_33.v

hierarchy -check -top multiplier16bit_33

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_33.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
