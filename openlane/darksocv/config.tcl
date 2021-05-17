set script_dir [file dirname [file normalize [info script]]]

# User config
set ::env(DESIGN_NAME) darksocv

# Change if needed
#set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/darksocv.v"

# Fill this
set ::env(CLOCK_PERIOD) "20"
set ::env(CLOCK_PORT) "XCLK"

#-> Do the below from the bash shell inside docker
#export STD_CELL_LIBRARY="sky130_fd_sc_ls"

set ::env(CLOCK_NET) $::env(CLOCK_PORT)

set ::env(FP_CORE_UTIL) "40"
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]
#set ::env(PL_BASIC_PLACEMENT) 0

#set ::env(FP_PDN_AUTO_ADJUST) "1"

set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]
set ::env(FP_PDN_CHECK_NODES) 0

# New 
# set ::env(MACRO_PLACEMENT_CFG) $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/macro_placement.cfg
#set ::env(MACRO_PLACEMENT_CFG) "macro_placement.cfg"
#set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/blackboxes/*.v]
set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/darkriscv.v \
	$script_dir/../../verilog/rtl/darkuart.v"

#set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/macros/lef/*.lef]
set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/darkriscv.lef \
	$script_dir/../../lef/darkuart.lef"

#set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/macros/gds/*.gds]
set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/darkriscv.gds \
	$script_dir/../../gds/darkuart.gds"

set ::env(SYNTH_FLAT_TOP) 1

#set ::env(FP_PDN_VOFFSET) 0
#set ::env(FP_PDN_VPITCH) 30
#set ::env(PDN_CFG) $::env(DESIGN_DIR)/pdn.tcl

#set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
#if { [file exists $filename] == 1} {
#	source $filename
#}

