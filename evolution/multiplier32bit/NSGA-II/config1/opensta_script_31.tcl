
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_8_1.v
read_verilog ../modules/netlist/NR_3_5.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_6_2.v
read_verilog ../modules/netlist/NR_6_3.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/NR_6_18.v
read_verilog ../modules/netlist/NR_5_5.v
read_verilog ../modules/netlist/NR_5_4.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_9_9.v
read_verilog ../modules/netlist/NR_6_6.v
read_verilog ../modules/netlist/NR_5_3.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_2_6.v
read_verilog ../modules/netlist/NR_1_5.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_3_6.v
read_verilog ../modules/netlist/NR_4_1.v
read_verilog ../modules/netlist/NR_24_8.v
read_verilog ../modules/netlist/NR_1_8.v
read_verilog ../modules/netlist/NR_8_24.v
read_verilog ../modules/netlist/NR_1_4.v
read_verilog ../modules/netlist/NR_4_5.v
read_verilog ../modules/netlist/NR_5_1.v
read_verilog ../modules/netlist/NR_18_6.v
read_verilog ../modules/netlist/customAdder27_8.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder6_1.v
read_verilog ../modules/netlist/customAdder12_2.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder42_17.v
read_verilog ../modules/netlist/customAdder32_0.v
read_verilog ../modules/netlist/customAdder24_0.v
read_verilog ../modules/netlist/customAdder17_8.v
read_verilog ../modules/netlist/customAdder8_0.v
read_verilog ../modules/netlist/customAdder14_5.v
read_verilog ../modules/netlist/customAdder11_2.v
read_verilog ../modules/netlist/customAdder9_0.v
read_verilog ../modules/netlist/customAdder14_4.v
read_verilog ../modules/netlist/customAdder56_23.v
read_verilog ../modules/netlist/customAdder11_5.v
read_verilog ../modules/netlist/customAdder5_2.v
read_verilog ../modules/netlist/customAdder9_4.v
read_verilog ../modules/netlist/customAdder18_0.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder4_0.v

read_verilog ../circuits/multiplier32bit/NSGA-II/config1/multiplier32bit_31.v 


#identify the top module name
link_design multiplier32bit_31

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_31.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_31.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
