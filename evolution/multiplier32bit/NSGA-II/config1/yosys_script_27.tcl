
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_4_17.v
read_verilog -overwrite ../modules/netlist/NR_3_29.v
read_verilog -overwrite ../modules/netlist/NR_3_21.v
read_verilog -overwrite ../modules/netlist/NR_29_3.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_24_5.v
read_verilog -overwrite ../modules/netlist/NR_17_17.v
read_verilog -overwrite ../modules/netlist/NR_21_3.v
read_verilog -overwrite ../modules/netlist/NR_5_24.v
read_verilog -overwrite ../modules/netlist/NR_17_4.v
read_verilog -overwrite ../modules/netlist/customAdder24_0.v
read_verilog -overwrite ../modules/netlist/customAdder21_0.v
read_verilog -overwrite ../modules/netlist/customAdder6_1.v
read_verilog -overwrite ../modules/netlist/customAdder45_20.v
read_verilog -overwrite ../modules/netlist/customAdder34_4.v
read_verilog -overwrite ../modules/netlist/customAdder35_2.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder38_16.v
read_verilog -overwrite ../modules/netlist/customAdder29_0.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_27.v

hierarchy -check -top multiplier32bit_27

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_27.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
