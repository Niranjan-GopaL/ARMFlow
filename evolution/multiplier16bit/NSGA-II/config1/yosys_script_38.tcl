
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_12_4.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_3_7.v
read_verilog -overwrite ../modules/netlist/NR_4_12.v
read_verilog -overwrite ../modules/netlist/NR_5_10.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_1_15.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_10_2.v
read_verilog -overwrite ../modules/netlist/NR_10_5.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_2_10.v
read_verilog -overwrite ../modules/netlist/NR_15_1.v
read_verilog -overwrite ../modules/netlist/NR_7_3.v
read_verilog -overwrite ../modules/netlist/NR_3_2.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_2_3.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder25_9.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder15_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_2.v
read_verilog -overwrite ../modules/netlist/customAdder8_2.v
read_verilog -overwrite ../modules/netlist/customAdder31_15.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v

read_verilog -overwrite ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_38.v

hierarchy -check -top multiplier16bit_38

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_result_38.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
