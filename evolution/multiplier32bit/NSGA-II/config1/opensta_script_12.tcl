
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_2_11.v
read_verilog ../modules/netlist/NR_15_6.v
read_verilog ../modules/netlist/NR_29_3.v
read_verilog ../modules/netlist/NR_2_13.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_21_3.v
read_verilog ../modules/netlist/NR_5_24.v
read_verilog ../modules/netlist/NR_4_4.v
read_verilog ../modules/netlist/NR_6_15.v
read_verilog ../modules/netlist/NR_2_9.v
read_verilog ../modules/netlist/NR_13_2.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_5_4.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_3_29.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_5.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_4_1.v
read_verilog ../modules/netlist/NR_3_21.v
read_verilog ../modules/netlist/NR_11_2.v
read_verilog ../modules/netlist/NR_1_4.v
read_verilog ../modules/netlist/NR_4_5.v
read_verilog ../modules/netlist/NR_5_1.v
read_verilog ../modules/netlist/NR_24_5.v
read_verilog ../modules/netlist/NR_9_2.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder32_0.v
read_verilog ../modules/netlist/customAdder24_0.v
read_verilog ../modules/netlist/customAdder21_0.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder29_0.v
read_verilog ../modules/netlist/customAdder9_0.v
read_verilog ../modules/netlist/customAdder27_2.v
read_verilog ../modules/netlist/customAdder15_0.v
read_verilog ../modules/netlist/customAdder14_4.v
read_verilog ../modules/netlist/customAdder35_2.v
read_verilog ../modules/netlist/customAdder24_10.v
read_verilog ../modules/netlist/customAdder36_14.v
read_verilog ../modules/netlist/customAdder11_0.v
read_verilog ../modules/netlist/customAdder9_4.v
read_verilog ../modules/netlist/customAdder7_3.v
read_verilog ../modules/netlist/customAdder20_8.v
read_verilog ../modules/netlist/customAdder13_0.v
read_verilog ../modules/netlist/customAdder34_4.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder28_12.v

read_verilog ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_12.v 


#identify the top module name
link_design multiplier32bit_12

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_12.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_12.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
