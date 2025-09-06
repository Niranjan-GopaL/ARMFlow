
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_4_4.v
read_verilog ../modules/netlist/NR_8_8.v
read_verilog ../modules/netlist/NR_3_8.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_4.v
read_verilog ../modules/netlist/NR_2_3.v
read_verilog ../modules/netlist/NR_8_3.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_3_2.v
read_verilog ../modules/netlist/NR_4_1.v
read_verilog ../modules/netlist/customAdder9_0.v
read_verilog ../modules/netlist/customAdder13_4.v
read_verilog ../modules/netlist/customAdder32_8.v
read_verilog ../modules/netlist/customAdder23_0.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder14_0.v
read_verilog ../modules/netlist/customAdder32_0.v
read_verilog ../modules/netlist/customAdder17_2.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder55_22.v
read_verilog ../modules/netlist/customAdder8_2.v
read_verilog ../modules/netlist/customAdder5_2.v

read_verilog ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_0.v 


#identify the top module name
link_design multiplier32bit_0

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_0.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_0.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
