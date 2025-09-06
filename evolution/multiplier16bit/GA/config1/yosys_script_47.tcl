
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_4_4.v
read_verilog -overwrite ../modules/netlist/NR_11_1.v
read_verilog -overwrite ../modules/netlist/NR_1_12.v
read_verilog -overwrite ../modules/netlist/NR_12_1.v
read_verilog -overwrite ../modules/netlist/NR_1_11.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_4_6.v
read_verilog -overwrite ../modules/netlist/NR_10_1.v
read_verilog -overwrite ../modules/netlist/NR_6_4.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_1_10.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/customAdder21_10.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder11_0.v
read_verilog -overwrite ../modules/netlist/customAdder12_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder10_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_3.v
read_verilog -overwrite ../modules/netlist/customAdder19_2.v
read_verilog -overwrite ../modules/netlist/customAdder23_11.v

read_verilog -overwrite ../evolution/multiplier16bit/GA/config1/multiplier16bit_47.v

hierarchy -check -top multiplier16bit_47

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_47.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
