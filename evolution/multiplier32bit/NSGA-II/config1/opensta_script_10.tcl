
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_1_9.v
read_verilog ../modules/netlist/NR_8_8.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_2_4.v
read_verilog ../modules/netlist/NR_6_8.v
read_verilog ../modules/netlist/NR_16_2.v
read_verilog ../modules/netlist/NR_12_4.v
read_verilog ../modules/netlist/NR_4_12.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/NR_5_4.v
read_verilog ../modules/netlist/NR_1_11.v
read_verilog ../modules/netlist/NR_2_16.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_18_14.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_14_18.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_4_1.v
read_verilog ../modules/netlist/NR_9_1.v
read_verilog ../modules/netlist/NR_4_2.v
read_verilog ../modules/netlist/NR_10_1.v
read_verilog ../modules/netlist/NR_1_4.v
read_verilog ../modules/netlist/NR_8_6.v
read_verilog ../modules/netlist/NR_4_5.v
read_verilog ../modules/netlist/NR_1_10.v
read_verilog ../modules/netlist/NR_11_1.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder6_1.v
read_verilog ../modules/netlist/customAdder32_0.v
read_verilog ../modules/netlist/customAdder46_13.v
read_verilog ../modules/netlist/customAdder19_9.v
read_verilog ../modules/netlist/customAdder10_0.v
read_verilog ../modules/netlist/customAdder21_10.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder14_0.v
read_verilog ../modules/netlist/customAdder34_15.v
read_verilog ../modules/netlist/customAdder9_0.v
read_verilog ../modules/netlist/customAdder10_3.v
read_verilog ../modules/netlist/customAdder16_0.v
read_verilog ../modules/netlist/customAdder11_0.v
read_verilog ../modules/netlist/customAdder13_3.v
read_verilog ../modules/netlist/customAdder5_2.v
read_verilog ../modules/netlist/customAdder9_4.v
read_verilog ../modules/netlist/customAdder22_7.v
read_verilog ../modules/netlist/customAdder7_3.v
read_verilog ../modules/netlist/customAdder18_0.v
read_verilog ../modules/netlist/customAdder23_11.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder20_3.v

read_verilog ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_10.v 


#identify the top module name
link_design multiplier32bit_10

#clock frequency
create_clock -period  10000 -name clk

#output load
set_load -pin_load 2.479712 [lsearch -inline -all -not -exact [all_outputs] clk]

set_driving_cell -lib_cell INVx1_ASAP7_75t_R [lsearch -inline -all -not -exact [all_inputs] clk]

#switching factor for truly random data
set_power_activity -input_ports [lsearch -inline -all -not -exact [all_inputs] clk] -activity 0.25


#input output delay constraint
set_input_delay 0 -clock clk [lsearch -inline -all -not -exact [all_inputs] clk]
set_output_delay 0 -clock clk [lsearch -inline -all -not -exact [all_outputs] clk]

#estimate power
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_10.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_10.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
