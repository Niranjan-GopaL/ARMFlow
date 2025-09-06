
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_5_1.v
read_verilog ../modules/netlist/NR_3_13.v
read_verilog ../modules/netlist/NR_9_5.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_2_5.v
read_verilog ../modules/netlist/NR_2_14.v
read_verilog ../modules/netlist/NR_7_1.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_3_6.v
read_verilog ../modules/netlist/NR_5_3.v
read_verilog ../modules/netlist/NR_5_9.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_5.v
read_verilog ../modules/netlist/NR_14_2.v
read_verilog ../modules/netlist/NR_3_2.v
read_verilog ../modules/netlist/NR_3_5.v
read_verilog ../modules/netlist/NR_5_2.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_2_3.v
read_verilog ../modules/netlist/NR_13_3.v
read_verilog ../modules/netlist/NR_1_7.v
read_verilog ../modules/netlist/NR_6_3.v
read_verilog ../modules/netlist/customAdder7_1.v
read_verilog ../modules/netlist/customAdder16_0.v
read_verilog ../modules/netlist/customAdder24_7.v
read_verilog ../modules/netlist/customAdder7_0.v
read_verilog ../modules/netlist/customAdder10_1.v
read_verilog ../modules/netlist/customAdder9_2.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder11_2.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder13_6.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder9_1.v
read_verilog ../modules/netlist/customAdder5_2.v

read_verilog ../evolution/multiplier16bit/GA/config2/multiplier16bit_18.v 


#identify the top module name
link_design multiplier16bit_18

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
report_power >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_18.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_18.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
