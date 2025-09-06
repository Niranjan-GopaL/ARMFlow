
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_2_11.v
read_verilog -overwrite ../modules/netlist/NR_15_6.v
read_verilog -overwrite ../modules/netlist/NR_29_3.v
read_verilog -overwrite ../modules/netlist/NR_2_13.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_21_3.v
read_verilog -overwrite ../modules/netlist/NR_5_24.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_6_15.v
read_verilog -overwrite ../modules/netlist/NR_2_9.v
read_verilog -overwrite ../modules/netlist/NR_13_2.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/NR_5_4.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_3_29.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_1_5.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_3_21.v
read_verilog -overwrite ../modules/netlist/NR_11_2.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_4_5.v
read_verilog -overwrite ../modules/netlist/NR_5_1.v
read_verilog -overwrite ../modules/netlist/NR_24_5.v
read_verilog -overwrite ../modules/netlist/NR_9_2.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v
read_verilog -overwrite ../modules/netlist/customAdder24_0.v
read_verilog -overwrite ../modules/netlist/customAdder21_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder29_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder27_2.v
read_verilog -overwrite ../modules/netlist/customAdder15_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_4.v
read_verilog -overwrite ../modules/netlist/customAdder35_2.v
read_verilog -overwrite ../modules/netlist/customAdder24_10.v
read_verilog -overwrite ../modules/netlist/customAdder36_14.v
read_verilog -overwrite ../modules/netlist/customAdder11_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_4.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder20_8.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder34_4.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder28_12.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_12.v

hierarchy -check -top multiplier32bit_12

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_12.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
