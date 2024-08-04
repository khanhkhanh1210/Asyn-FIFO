##################################################
#
#Khai Pham 
#HCMUT LAB 203 
#
##################################################
#file setup variables#
set top_module asynchronous_fifo
#set_db auto_ungroup none
##################################################
#Libraries setup#
set_db library "/opt/PDKs/skywater130/timing/sky130_fd_sc_hd__tt_025C_1v80.lib /home/admin/shared/sky130_sram_macros-main/sky130_sram_1kbyte_1rw1r_8x1024_8/sky130_sram_1kbyte_1rw1r_8x1024_8_TT_1p8V_25C.lib"
#set_db lef_library "/opt/PDKs/skywater130/tech/sky130_fd_sc_hd__nom.tlef /home/admin/shared/sky130_sram_macros-main/sky130_sram_1kbyte_1rw1r_8x1024_8/sky130_sram_1kbyte_1rw1r_8x1024_8.lef"
##################################################
#HDL files read#
read_hdl -sv -f 00_src/flist.f
##################################################
elaborate
set_top_module ${top_module}
write_hdl > 03_synth/${top_module}_elab.v
check_design -all
##################################################
#Timing constraint variables#
set FREQ_GHz 0.5 
set FREQ [ expr ${FREQ_GHz} * 1000000000.0 ]
set PERIOD_tmp [ expr (1.0/${FREQ}) ]
set PERIOD [ expr ${PERIOD_tmp} * 1000000000000.0 ]
puts "Clock Period = ${PERIOD} ps"
set IN_DLY [ expr $PERIOD/2.0 ]
set OUT_DLY [ expr $PERIOD/2.0 ]
set UNCER [expr ${PERIOD}/100000.0]
puts "Clock Uncertainty = ${UNCER} ns"
set TRANS [expr ${PERIOD}/10000.0] 
puts "max transition = ${TRANS} ns"
##################################################
#set constraint for clock and input with output#
set clock [define_clock -period $PERIOD -name wclk [get_ports wclk] ]
#create_clock -name "wclk" -period $PERIOD [get_ports wclk] 
set_dont_touch_network [get_clocks wclk]
set_clock_uncertainty ${UNCER} -setup -hold wclk
set_max_transition ${TRANS} [get_design ${top_module}] 
external_delay -clock wclk -input $IN_DLY  -name data_in [get_ports data_in]
external_delay -clock wclk -input $IN_DLY  -name w_en [get_ports w_en]
external_delay -clock wclk -output $OUT_DLY -name full [get_ports full]
##################################################
#set constraint for clock and input with output#
set clock [define_clock -period $PERIOD -name rclk [get_ports rclk] ]
#create_clock -name "rclk" -period $PERIOD [get_ports rclk] 
set_dont_touch_network [get_clocks rclk]
set_clock_uncertainty ${UNCER} -setup -hold rclk
external_delay -clock rclk -output $OUT_DLY  -name data_out [get_ports data_out]
external_delay -clock rclk -input $IN_DLY  -name r_en [get_ports r_en]
external_delay -clock rclk -output $OUT_DLY -name empty [get_ports empty]
set_false_path -from [get_clocks wclk] -to [get_clocks rclk]
##################################################
#Synthesize RTL code to generic#
syn_generic
write_hdl > 03_synth/${top_module}_generic.v
#Mapping technology to the generic#
syn_map
write_hdl > 03_synth/${top_module}_tech_map.v
#remove assignment statement 
remove_assigns_without_optimization -verbose
#Optimizing the mapped technology netlist#
syn_opt  

report timing -lint
##################################################
#design post-synthesis export#
#Export the netlist 
write_hdl > 03_synth/${top_module}_gate.v
#Export the standard delay format of the synthesized design #
write_sdf -edges check_edge -setuphold "split" -recrem split > 03_synth/${top_module}.sdf

##################################################
#Reports export#
report timing -max_paths 10 > 04_reports/${top_module}.timing.rpt
report hierarchy > 04_reports/${top_module}.hier.rpt
report gates > 04_reports/${top_module}.gates.rpt
report datapath > 04_reports/${top_module}.datapath.rpt
report qor > 04_reports/${top_module}.qor.rpt
report area > 04_reports/${top_module}.area.rpt
report power > 04_reports/${top_module}.power.rpt
##################################################
#Open genus GUI 
gui_show
