
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_4_4.v
read_verilog ../modules/netlist/NR_12_4.v
read_verilog ../modules/netlist/NR_9_9.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_2_10.v
read_verilog ../modules/netlist/NR_4_12.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_9_1.v
read_verilog ../modules/netlist/NR_1_9.v
read_verilog ../modules/netlist/NR_10_2.v
read_verilog ../modules/netlist/customAdder9_0.v
read_verilog ../modules/netlist/customAdder16_0.v
read_verilog ../modules/netlist/customAdder14_1.v
read_verilog ../modules/netlist/customAdder12_0.v
read_verilog ../modules/netlist/customAdder10_0.v
read_verilog ../modules/netlist/customAdder20_3.v

read_verilog ../evolution/multiplier16bit/GA/config1/multiplier16bit_43.v 


#identify the top module name
link_design multiplier16bit_43

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
report_power >> ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_43.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier16bit/GA/config1/multiplier16bit_result_43.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
