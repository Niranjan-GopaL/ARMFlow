
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_12_4.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_1_15.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_6_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_15_1.v
read_verilog ../modules/netlist/NR_4_12.v
read_verilog ../modules/netlist/NR_5_7.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_1_6.v
read_verilog ../modules/netlist/NR_7_5.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/customAdder17_1.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder12_0.v
read_verilog ../modules/netlist/customAdder25_12.v
read_verilog ../modules/netlist/customAdder7_0.v
read_verilog ../modules/netlist/customAdder19_6.v
read_verilog ../modules/netlist/customAdder15_0.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder6_0.v
read_verilog ../modules/netlist/customAdder31_15.v

read_verilog ../evolution/multiplier16bit/GA/config2/multiplier16bit_40.v 


#identify the top module name
link_design multiplier16bit_40

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
report_power >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_40.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier16bit/GA/config2/multiplier16bit_result_40.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
