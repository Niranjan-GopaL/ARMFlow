
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_3_10.v
read_verilog -overwrite ../modules/netlist/NR_10_10.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_10_3.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder16_2.v
read_verilog -overwrite ../modules/netlist/customAdder19_2.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_37.v

hierarchy -check -top multiplier16bit_37

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_37.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
