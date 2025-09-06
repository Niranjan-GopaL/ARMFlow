
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_3_2.v
read_verilog -overwrite ../modules/netlist/NR_16_4.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_16_16.v
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_20_7.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_7_20.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_5_27.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_4_16.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_27_5.v
read_verilog -overwrite ../modules/netlist/NR_2_3.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/customAdder27_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v
read_verilog -overwrite ../modules/netlist/customAdder7_1.v
read_verilog -overwrite ../modules/netlist/customAdder34_6.v
read_verilog -overwrite ../modules/netlist/customAdder59_26.v
read_verilog -overwrite ../modules/netlist/customAdder20_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_1.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v
read_verilog -overwrite ../modules/netlist/customAdder36_15.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_22.v

hierarchy -check -top multiplier32bit_22

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_22.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
