
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_7_20.v
read_verilog ../modules/netlist/NR_3_2.v
read_verilog ../modules/netlist/NR_27_5.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_20_7.v
read_verilog ../modules/netlist/NR_2_3.v
read_verilog ../modules/netlist/NR_7_7.v
read_verilog ../modules/netlist/NR_5_27.v
read_verilog ../modules/netlist/NR_20_20.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/customAdder27_0.v
read_verilog ../modules/netlist/customAdder7_1.v
read_verilog ../modules/netlist/customAdder34_6.v
read_verilog ../modules/netlist/customAdder37_4.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder32_0.v

read_verilog ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_34.v 


#identify the top module name
link_design multiplier32bit_34

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_34.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_34.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
