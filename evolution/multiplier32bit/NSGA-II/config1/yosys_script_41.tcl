
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_9.v
read_verilog -overwrite ../modules/netlist/NR_8_1.v
read_verilog -overwrite ../modules/netlist/NR_2_11.v
read_verilog -overwrite ../modules/netlist/NR_9_2.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_6_2.v
read_verilog -overwrite ../modules/netlist/NR_4_3.v
read_verilog -overwrite ../modules/netlist/NR_9_10.v
read_verilog -overwrite ../modules/netlist/NR_2_4.v
read_verilog -overwrite ../modules/netlist/NR_19_13.v
read_verilog -overwrite ../modules/netlist/NR_2_9.v
read_verilog -overwrite ../modules/netlist/NR_3_4.v
read_verilog -overwrite ../modules/netlist/NR_7_7.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_13_19.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_2_6.v
read_verilog -overwrite ../modules/netlist/NR_10_9.v
read_verilog -overwrite ../modules/netlist/NR_7_2.v
read_verilog -overwrite ../modules/netlist/NR_9_1.v
read_verilog -overwrite ../modules/netlist/NR_4_2.v
read_verilog -overwrite ../modules/netlist/NR_1_8.v
read_verilog -overwrite ../modules/netlist/NR_11_2.v
read_verilog -overwrite ../modules/netlist/NR_2_7.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder10_1.v
read_verilog -overwrite ../modules/netlist/customAdder29_9.v
read_verilog -overwrite ../modules/netlist/customAdder19_0.v
read_verilog -overwrite ../modules/netlist/customAdder11_1.v
read_verilog -overwrite ../modules/netlist/customAdder11_3.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v
read_verilog -overwrite ../modules/netlist/customAdder19_9.v
read_verilog -overwrite ../modules/netlist/customAdder6_0.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder51_18.v
read_verilog -overwrite ../modules/netlist/customAdder10_3.v
read_verilog -overwrite ../modules/netlist/customAdder24_10.v
read_verilog -overwrite ../modules/netlist/customAdder11_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_2.v
read_verilog -overwrite ../modules/netlist/customAdder20_8.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_41.v

hierarchy -check -top multiplier32bit_41

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_41.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
