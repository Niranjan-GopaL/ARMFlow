
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_1_5.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_4_6.v
read_verilog -overwrite ../modules/netlist/NR_6_4.v
read_verilog -overwrite ../modules/netlist/NR_5_1.v
read_verilog -overwrite ../modules/netlist/NR_10_6.v
read_verilog -overwrite ../modules/netlist/NR_6_10.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder18_7.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder26_9.v
read_verilog -overwrite ../modules/netlist/customAdder8_2.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config2/multiplier16bit_12.v

hierarchy -check -top multiplier16bit_12

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_12.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
