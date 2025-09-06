
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_5_1.v
read_verilog -overwrite ../modules/netlist/NR_10_6.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_1_6.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_2_8.v
read_verilog -overwrite ../modules/netlist/NR_6_2.v
read_verilog -overwrite ../modules/netlist/NR_7_1.v
read_verilog -overwrite ../modules/netlist/NR_4_2.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_8_2.v
read_verilog -overwrite ../modules/netlist/NR_2_4.v
read_verilog -overwrite ../modules/netlist/NR_1_5.v
read_verilog -overwrite ../modules/netlist/NR_6_1.v
read_verilog -overwrite ../modules/netlist/NR_6_10.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_1_7.v
read_verilog -overwrite ../modules/netlist/NR_2_6.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_4.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder24_7.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder15_7.v
read_verilog -overwrite ../modules/netlist/customAdder12_3.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_3.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v

read_verilog -overwrite ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_14.v

hierarchy -check -top multiplier16bit_14

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_result_14.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
