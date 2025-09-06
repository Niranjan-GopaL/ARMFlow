
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_3_4.v
read_verilog -overwrite ../modules/netlist/NR_4_3.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_5_1.v
read_verilog -overwrite ../modules/netlist/NR_11_5.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_1_6.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_1_9.v
read_verilog -overwrite ../modules/netlist/NR_7_1.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_3_6.v
read_verilog -overwrite ../modules/netlist/NR_9_1.v
read_verilog -overwrite ../modules/netlist/NR_9_7.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_1_5.v
read_verilog -overwrite ../modules/netlist/NR_6_1.v
read_verilog -overwrite ../modules/netlist/NR_1_8.v
read_verilog -overwrite ../modules/netlist/NR_7_9.v
read_verilog -overwrite ../modules/netlist/NR_3_2.v
read_verilog -overwrite ../modules/netlist/NR_5_11.v
read_verilog -overwrite ../modules/netlist/NR_8_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_10_1.v
read_verilog -overwrite ../modules/netlist/NR_2_3.v
read_verilog -overwrite ../modules/netlist/NR_1_7.v
read_verilog -overwrite ../modules/netlist/NR_1_10.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_6_3.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder21_10.v
read_verilog -overwrite ../modules/netlist/customAdder7_1.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder19_9.v
read_verilog -overwrite ../modules/netlist/customAdder13_6.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder21_4.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config2/multiplier16bit_36.v

hierarchy -check -top multiplier16bit_36

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_36.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
