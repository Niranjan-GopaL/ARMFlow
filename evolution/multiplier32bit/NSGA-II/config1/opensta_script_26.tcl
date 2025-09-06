
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_3_19.v
read_verilog ../modules/netlist/NR_15_4.v
read_verilog ../modules/netlist/NR_15_15.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_28_4.v
read_verilog ../modules/netlist/NR_19_3.v
read_verilog ../modules/netlist/NR_4_15.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_22_6.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_5.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_6_22.v
read_verilog ../modules/netlist/NR_5_1.v
read_verilog ../modules/netlist/NR_4_28.v
read_verilog ../modules/netlist/customAdder34_14.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder6_1.v
read_verilog ../modules/netlist/customAdder36_3.v
read_verilog ../modules/netlist/customAdder7_3.v
read_verilog ../modules/netlist/customAdder22_0.v
read_verilog ../modules/netlist/customAdder41_18.v
read_verilog ../modules/netlist/customAdder19_0.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder28_0.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder34_5.v
read_verilog ../modules/netlist/customAdder32_0.v

read_verilog ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_26.v 


#identify the top module name
link_design multiplier32bit_26

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_26.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_26.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
