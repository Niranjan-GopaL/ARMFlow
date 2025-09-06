
#----------------- opensta commands ----------------------
#----------estimating power in opensta-----------
#import the library file
read_liberty ../libFiles/ASAP_7nm_RVT_TT.lib

#read the design file
read_verilog ../modules/netlist/NR_3_1.v
read_verilog ../modules/netlist/NR_5_4.v
read_verilog ../modules/netlist/NR_3_10.v
read_verilog ../modules/netlist/NR_10_3.v
read_verilog ../modules/netlist/NR_2_2.v
read_verilog ../modules/netlist/NR_24_2.v
read_verilog ../modules/netlist/NR_1_3.v
read_verilog ../modules/netlist/NR_13_11.v
read_verilog ../modules/netlist/NR_4_2.v
read_verilog ../modules/netlist/NR_4_5.v
read_verilog ../modules/netlist/NR_3_3.v
read_verilog ../modules/netlist/NR_6_26.v
read_verilog ../modules/netlist/NR_2_4.v
read_verilog ../modules/netlist/NR_1_2.v
read_verilog ../modules/netlist/NR_2_1.v
read_verilog ../modules/netlist/NR_11_13.v
read_verilog ../modules/netlist/NR_4_1.v
read_verilog ../modules/netlist/NR_1_1.v
read_verilog ../modules/netlist/NR_1_4.v
read_verilog ../modules/netlist/NR_26_6.v
read_verilog ../modules/netlist/NR_2_24.v
read_verilog ../modules/netlist/customAdder4_0.v
read_verilog ../modules/netlist/customAdder10_0.v
read_verilog ../modules/netlist/customAdder32_0.v
read_verilog ../modules/netlist/customAdder58_25.v
read_verilog ../modules/netlist/customAdder10_3.v
read_verilog ../modules/netlist/customAdder7_1.v
read_verilog ../modules/netlist/customAdder23_9.v
read_verilog ../modules/netlist/customAdder3_0.v
read_verilog ../modules/netlist/customAdder5_0.v
read_verilog ../modules/netlist/customAdder8_2.v
read_verilog ../modules/netlist/customAdder9_4.v
read_verilog ../modules/netlist/customAdder50_23.v
read_verilog ../modules/netlist/customAdder15_4.v
read_verilog ../modules/netlist/customAdder35_10.v
read_verilog ../modules/netlist/customAdder14_2.v
read_verilog ../modules/netlist/customAdder5_2.v
read_verilog ../modules/netlist/customAdder11_0.v
read_verilog ../modules/netlist/customAdder2_0.v
read_verilog ../modules/netlist/customAdder24_0.v
read_verilog ../modules/netlist/customAdder13_0.v
read_verilog ../modules/netlist/customAdder26_0.v
read_verilog ../modules/netlist/customAdder6_0.v

read_verilog ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_1.v 


#identify the top module name
link_design multiplier32bit_1

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
report_power >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_1.txt

#----------estimating power in opensta-----------


#----------------estimating critical path delay -------------------


#critical path delay
report_checks -unconstrained >> ../evolution/multiplier32bit/NSGA-II/config1/multiplier32bit_result_1.txt
#----------------estimating critical path delay -------------------

#exit
exit

#----------------- opensta commands ----------------------
