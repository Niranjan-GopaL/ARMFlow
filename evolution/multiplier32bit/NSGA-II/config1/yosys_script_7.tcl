
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_14_4.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_25_1.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_26_2.v
read_verilog -overwrite ../modules/netlist/NR_18_7.v
read_verilog -overwrite ../modules/netlist/NR_2_26.v
read_verilog -overwrite ../modules/netlist/NR_18_11.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_4_14.v
read_verilog -overwrite ../modules/netlist/NR_11_7.v
read_verilog -overwrite ../modules/netlist/NR_29_3.v
read_verilog -overwrite ../modules/netlist/NR_3_2.v
read_verilog -overwrite ../modules/netlist/NR_7_18.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/NR_28_4.v
read_verilog -overwrite ../modules/netlist/NR_14_14.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_4_28.v
read_verilog -overwrite ../modules/netlist/NR_2_3.v
read_verilog -overwrite ../modules/netlist/NR_3_29.v
read_verilog -overwrite ../modules/netlist/NR_11_18.v
read_verilog -overwrite ../modules/netlist/NR_7_11.v
read_verilog -overwrite ../modules/netlist/NR_1_25.v
read_verilog -overwrite ../modules/netlist/customAdder25_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_1.v
read_verilog -overwrite ../modules/netlist/customAdder28_0.v
read_verilog -overwrite ../modules/netlist/customAdder54_25.v
read_verilog -overwrite ../modules/netlist/customAdder18_0.v
read_verilog -overwrite ../modules/netlist/customAdder43_17.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v
read_verilog -overwrite ../modules/netlist/customAdder36_3.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder22_3.v
read_verilog -overwrite ../modules/netlist/customAdder9_1.v
read_verilog -overwrite ../modules/netlist/customAdder51_25.v

read_verilog -overwrite ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_7.v

hierarchy -check -top multiplier32bit_7

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_7.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
