
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_1_2.v
read_verilog -overwrite ../modules/netlist/NR_2_1.v
read_verilog -overwrite ../modules/netlist/NR_4_1.v
read_verilog -overwrite ../modules/netlist/NR_3_1.v
read_verilog -overwrite ../modules/netlist/NR_1_1.v
read_verilog -overwrite ../modules/netlist/NR_1_4.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_2_2.v
read_verilog -overwrite ../modules/netlist/NR_5_3.v
read_verilog -overwrite ../modules/netlist/NR_1_3.v
read_verilog -overwrite ../modules/netlist/NR_3_5.v
read_verilog -overwrite ../modules/netlist/customAdder4_0.v
read_verilog -overwrite ../modules/netlist/customAdder2_0.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v
read_verilog -overwrite ../modules/netlist/customAdder3_0.v
read_verilog -overwrite ../modules/netlist/customAdder11_2.v
read_verilog -overwrite ../modules/netlist/customAdder5_0.v

read_verilog -overwrite ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_9.v

hierarchy -check -top multiplier8bit_9

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_result_9.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
