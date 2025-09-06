
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_1_15.v
read_verilog -overwrite ../modules/netlist/NR_5_8.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_15_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_2_13.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_13_2.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_8_5.v
read_verilog -overwrite ../modules/netlist/customAdder18_4.v
read_verilog -overwrite ../modules/netlist/customAdder17_1.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder12_3.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder15_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config2/multiplier16bit_30.v

hierarchy -check -top multiplier16bit_30

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_30.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
