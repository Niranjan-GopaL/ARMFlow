
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_9_7.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_2_7.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_7_9.v
read_verilog -overwrite ../modules/netlist/NR_7_2.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/customAdder12_4.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder16_6.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v
read_verilog -overwrite ../modules/netlist/customAdder25_8.v
read_verilog -overwrite ../modules/netlist/customAdder9_1.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config2/multiplier16bit_28.v

hierarchy -check -top multiplier16bit_28

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_28.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
