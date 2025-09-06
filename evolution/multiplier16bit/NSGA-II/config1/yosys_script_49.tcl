
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_5_4.v
read_verilog -overwrite ../modules/netlist/NR_9_2.v
read_verilog -overwrite ../modules/netlist/NR_2_9.v
read_verilog -overwrite ../modules/netlist/NR_4_5.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_11_2.v
read_verilog -overwrite ../modules/netlist/NR_13_3.v
read_verilog -overwrite ../modules/netlist/NR_3_13.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_2_11.v
read_verilog -overwrite ../modules/netlist/customAdder9_0.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder14_4.v
read_verilog -overwrite ../modules/netlist/customAdder16_0.v
read_verilog -overwrite ../modules/netlist/customAdder13_1.v
read_verilog -overwrite ../modules/netlist/customAdder11_0.v
read_verilog -overwrite ../modules/netlist/customAdder15_1.v
read_verilog -overwrite ../modules/netlist/customAdder13_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder29_12.v

read_verilog -overwrite ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_49.v

hierarchy -check -top multiplier16bit_49

#store the area result in a file
tee -q -o ../evolution/multiplier16bit/NSGA-II/config1/multiplier16bit_result_49.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
