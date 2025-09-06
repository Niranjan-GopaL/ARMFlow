
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_2_11.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_6_2.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_16_2.v
read_verilog -overwrite ../modules/netlist/NR_25_7.v
read_verilog -overwrite ../modules/netlist/NR_7_25.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_7_7.v
read_verilog -overwrite ../modules/netlist/NR_5_2.v
read_verilog -overwrite ../modules/netlist/NR_8_3.v
read_verilog -overwrite ../modules/netlist/NR_2_16.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_3_8.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_2_6.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_11_2.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_7_18.v
read_verilog -overwrite ../modules/netlist/NR_18_7.v
read_verilog -overwrite ../modules/netlist/NR_2_5.v
read_verilog -overwrite ../modules/netlist/customAdder15_1.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v
read_verilog -overwrite ../modules/netlist/customAdder12_4.v
read_verilog -overwrite ../modules/netlist/customAdder43_17.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_5.v
read_verilog -overwrite ../modules/netlist/customAdder34_15.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder11_0.v
read_verilog -overwrite ../modules/netlist/customAdder19_7.v
read_verilog -overwrite ../modules/netlist/customAdder19_2.v
read_verilog -overwrite ../modules/netlist/customAdder7_3.v
read_verilog -overwrite ../modules/netlist/customAdder18_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder25_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder7_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder39_6.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_13.v

hierarchy -check -top multiplier32bit_13

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_13.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
