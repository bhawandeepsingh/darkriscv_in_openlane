set script_dir [file dirname [file normalize [info script]]]

# User config
set ::env(DESIGN_NAME) darkriscv

# Change if needed
#set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES) "$script_dir/../../verilog/rtl/darkriscv.v"

# Fill this
set ::env(CLOCK_PERIOD) "20"
set ::env(CLOCK_PORT) "CLK"
set ::env(DESIGN_IS_CORE) 0
set ::env(SYNTH_MAX_TRANS) "0.2"
set ::env(SYNTH_NO_FLAT) 1
#set ::env(SYNTH_SIZING) "1"
#set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 1
#set ::env(PL_RESIZER_MAX_WIRE_LENGTH) 1

set ::env(FP_CORE_UTIL) "40"
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

#set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
#if { [file exists $filename] == 1} {
#	source $filename
#}

# If you're going to use multiple power domains, then keep this disabled.
#set ::env(RUN_CVC) 0
