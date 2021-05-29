set script_dir [file dirname [file normalize [info script]]]

# User config
set ::env(DESIGN_NAME) user_project_wrapper

# Change if needed
#set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../verilog/rtl/darksocv.v \
	$script_dir/../../verilog/rtl/darkriscv.v \
	$script_dir/../../verilog/rtl/darkuart.v"

# Fill this
set ::env(CLOCK_PERIOD) "100"
set ::env(CLOCK_PORT) "user_clock2"

#-> Do the below from the bash shell inside docker
#export STD_CELL_LIBRARY="sky130_fd_sc_ls"

set ::env(CLOCK_NET) $::env(CLOCK_PORT)
#set ::env(CLOCK_NET) "XCLK"
#set ::env(CLOCK_NET) "CLK"
#set ::env(CLOCK_NET) "core0.CLK"
#set ::env(CLOCK_NET) "uart0.CLK"

set ::env(SYNTH_MAX_TRANS) "0.2"

set ::env(FP_CORE_UTIL) "40"
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+1) / 100.0 ]

set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(GLB_RT_ADJUSTMENT) .20
#set ::env(GLOBAL_ROUTER) "cugr"
#set ::env(DETAILED_ROUTER) "drcu"
#set ::env(GLB_RT_OVERFLOW_ITERS) 200

set ::env(FP_PDN_AUTO_ADJUST) "1"

set ::env(DESIGN_IS_CORE) 1
set ::env(FP_PDN_CORE_RING) 1
#set ::env(GLB_RT_MAXLAYER) 5

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]
set ::env(SYNTH_USE_PG_PINS_DEFINES) "USE_POWER_PINS"
set ::env(FP_PDN_CHECK_NODES) 0

set ::env(FP_PDN_CORE_RING_VWIDTH) 3 
set ::env(FP_PDN_CORE_RING_HWIDTH) $::env(FP_PDN_CORE_RING_VWIDTH) 
set ::env(FP_PDN_CORE_RING_VOFFSET) 14 
set ::env(FP_PDN_CORE_RING_HOFFSET) $::env(FP_PDN_CORE_RING_VOFFSET) 
set ::env(FP_PDN_CORE_RING_VSPACING) 1.7 
set ::env(FP_PDN_CORE_RING_HSPACING) $::env(FP_PDN_CORE_RING_VSPACING)

set ::env(FP_PDN_VSPACING) [expr 5*$::env(FP_PDN_CORE_RING_VWIDTH)]
set ::env(FP_PDN_HSPACING) [expr 5*$::env(FP_PDN_CORE_RING_HWIDTH)]

set ::env(FP_PDN_VWIDTH) 3 
set ::env(FP_PDN_HWIDTH) 3 
set ::env(FP_PDN_VOFFSET) 0 
set ::env(FP_PDN_HOFFSET) $::env(FP_PDN_VOFFSET) 
set ::env(FP_PDN_VPITCH) 180 
set ::env(FP_PDN_HPITCH) $::env(FP_PDN_VPITCH) 



#set ::env(PL_RANDOM_GLB_PLACEMENT) 1
set ::env(PL_BASIC_PLACEMENT) 0

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(FILL_INSERTION) 0
set ::env(TAP_DECAP_INSERTION) 0
#set ::env(CLOCK_TREE_SYNTH) 0

# New 
# set ::env(MACRO_PLACEMENT_CFG) $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/macro_placement.cfg
##set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro.cfg
#set ::env(MACRO_PLACEMENT_CFG) ./macro.cfg
#
#
##set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/blackboxes/*.v]
#set ::env(VERILOG_FILES_BLACKBOX) "\
#	$script_dir/../../caravel/verilog/rtl/defines.v \
#	$script_dir/../../verilog/rtl/darkriscv.v \
#	$script_dir/../../verilog/rtl/darkuart.v"
#
##set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/macros/lef/*.lef]
#set ::env(EXTRA_LEFS) "\
#	$script_dir/../../lef/darkriscv.lef \
#	$script_dir/../../lef/darkuart.lef"
#
##set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/macros/gds/*.gds]
#set ::env(EXTRA_GDS_FILES) "\
#	$script_dir/../../gds/darkriscv.gds \
#	$script_dir/../../gds/darkuart.gds"

set ::env(SYNTH_FLAT_TOP) 1
#set ::env(SYNTH_NO_FLAT) 1


#set ::env(FP_PDN_VOFFSET) 0
#set ::env(FP_PDN_VPITCH) 30
#set ::env(PDN_CFG) $::env(DESIGN_DIR)/pdn.tcl


set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

