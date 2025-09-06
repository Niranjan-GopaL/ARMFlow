
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_3_2.v
read_verilog -overwrite ../modules/netlist/NR_6_14.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_2_4.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_25_7.v
read_verilog -overwrite ../modules/netlist/NR_20_5.v
read_verilog -overwrite ../modules/netlist/NR_7_25.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_14_6.v
read_verilog -overwrite ../modules/netlist/NR_4_2.v
read_verilog -overwrite ../modules/netlist/NR_5_20.v
read_verilog -overwrite ../modules/netlist/NR_2_3.v
read_verilog -overwrite ../modules/netlist/NR_14_14.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/customAdder8_1.v
read_verilog -overwrite ../modules/netlist/customAdder45_19.v
read_verilog -overwrite ../modules/netlist/customAdder34_13.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_1.v
read_verilog -overwrite ../modules/netlist/customAdder57_24.v
read_verilog -overwrite ../modules/netlist/customAdder20_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder25_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder12_4.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_11.v

hierarchy -check -top multiplier32bit_11

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_11.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
