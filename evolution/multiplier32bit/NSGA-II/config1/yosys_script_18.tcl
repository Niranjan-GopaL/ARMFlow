
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_4_15.v
read_verilog -overwrite ../modules/netlist/NR_4_2.v
read_verilog -overwrite ../modules/netlist/NR_15_4.v
read_verilog -overwrite ../modules/netlist/NR_26_6.v
read_verilog -overwrite ../modules/netlist/NR_7_19.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_15_15.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_6_26.v
read_verilog -overwrite ../modules/netlist/NR_4_3.v
read_verilog -overwrite ../modules/netlist/NR_3_4.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_19_7.v
read_verilog -overwrite ../modules/netlist/NR_2_4.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/customAdder58_25.v
read_verilog -overwrite ../modules/netlist/customAdder34_14.v
read_verilog -overwrite ../modules/netlist/customAdder33_6.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder26_0.v
read_verilog -overwrite ../modules/netlist/customAdder19_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_3.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder11_3.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_18.v

hierarchy -check -top multiplier32bit_18

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_18.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
