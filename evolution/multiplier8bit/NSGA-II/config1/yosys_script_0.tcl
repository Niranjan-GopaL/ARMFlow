
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_5_3.v
read_verilog -overwrite ../modules/netlist/NR_3_3.v
read_verilog -overwrite ../modules/netlist/NR_3_5.v
read_verilog -overwrite ../modules/netlist/NR_5_5.v
read_verilog -overwrite ../modules/netlist/customAdder11_2.v
read_verilog -overwrite ../modules/netlist/customAdder8_0.v

read_verilog -overwrite ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_0.v

hierarchy -check -top multiplier8bit_0

#store the area result in a file
tee -q -o ../evolution/multiplier8bit/NSGA-II/config1/multiplier8bit_result_0.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
