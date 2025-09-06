
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_2_14.v
read_verilog ../modules/netlist/NR_8_8.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_3_11.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_11_3.v
read_verilog ../modules/netlist/NR_10_1.v
read_verilog ../modules/netlist/NR_1_10.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_8_2.v
read_verilog ../modules/netlist/NR_14_2.v
read_verilog ../modules/netlist/NR_2_8.v
read_verilog ../modules/netlist/customAdder18_1.v
read_verilog ../modules/netlist/customAdder18_7.v
read_verilog ../modules/netlist/customAdder16_0.v
read_verilog ../modules/netlist/customAdder11_0.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder14_0.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder10_0.v
read_verilog ../modules/netlist/customAdder25_10.v

read_verilog ../evolution/multiplier16bit/GA/config2/multiplier16bit_13.v 


#identify the top module name
link_design multiplier16bit_13

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
report_power >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_13.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_13.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
