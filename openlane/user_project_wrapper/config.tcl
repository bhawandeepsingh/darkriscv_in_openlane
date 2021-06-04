set script_dir [file dirname [file normalize [info script]]]
source $script_dir/fixed_wrapper_cfgs.tcl

# User config
set ::env(DESIGN_NAME) user_project_wrapper

# Change if needed
#set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v"

# Fill this
set ::env(CLOCK_PERIOD) "20"
set ::env(CLOCK_PORT) "user_clock2"

#-> Do the below from the bash shell inside docker
#export STD_CELL_LIBRARY="sky130_fd_sc_ls"

set ::env(CLOCK_NET) $::env(CLOCK_PORT)
#set ::env(CLOCK_NET) "XCLK"
#set ::env(CLOCK_NET) "CLK"
#set ::env(CLOCK_NET) "core0.CLK"
#set ::env(CLOCK_NET) "uart0.CLK"


#set ::env(GLOBAL_ROUTER) "cugr"
#set ::env(DETAILED_ROUTER) "drcu"

set ::env(GLB_RT_MAXLAYER) 5
set ::env(FP_PDN_CHECK_NODES) 0

set ::env(SYNTH_TOP_LEVEL) 1
set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_BUFFER_INPUT_PORTS) 0
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(FILL_INSERTION) 0
set ::env(TAP_DECAP_INSERTION) 0
set ::env(CLOCK_TREE_SYNTH) 0

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(MAGIC_WRITE_FULL_LEF) 1

# New 
# set ::env(MACRO_PLACEMENT_CFG) $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/macro_placement.cfg
#set ::env(MACRO_PLACEMENT_CFG) $::env(DESIGN_DIR)/macro.cfg
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg


#set ::env(VERILOG_FILES_BLACKBOX) [glob $::env(DESIGN_DIR)/blackboxes/*.v]
set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/darksocv.v"

#set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/macros/lef/*.lef]
set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/darksocv.lef"

#set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/macros/gds/*.gds]
set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/darksocv.gds"



set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

