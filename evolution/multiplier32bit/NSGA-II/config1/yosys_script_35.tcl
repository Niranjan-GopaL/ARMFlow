
#---------------- yosys commands -------------------
#import yosys environment
yosys -import

#read liberty file for required technology
read_liberty -lib ../libFiles/ASAP_7nm_RVT_TT.lib

#read verilog design file
read_verilog -overwrite ../modules/netlist/NR_6_26.v
read_verilog -overwrite ../modules/netlist/NR_6_6.v
read_verilog -overwrite ../modules/netlist/NR_26_26.v
read_verilog -overwrite ../modules/netlist/NR_26_6.v
read_verilog -overwrite ../modules/netlist/customAdder58_25.v
read_verilog -overwrite ../modules/netlist/customAdder32_0.v

read_verilog -overwrite ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_35.v

hierarchy -check -top multiplier32bit_35

#store the area result in a file
tee -q -o ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_35.txt stat -liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#exit
exit


#---------------- yosys commands -------------------
