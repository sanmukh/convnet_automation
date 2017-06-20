#Certain solution specific variables. 
#TODO: pickup from commandline args
variable SOLN baseline
#Common to all simulations
set DesignDir $::env(HOME)/vivado/Convnet_automation/convnet_automation/$SOLN
set XilinxLibDir /opt/Xilinx/Vivado/2014.2/data/verilog/src/
cd $DesignDir
file mkdir $DesignDir/report
file mkdir $DesignDir/tmp

create_project -force ip
set ip_scripts [glob $DesignDir/syn/verilog/*.tcl]
foreach script $ip_scripts {
	source $script
}
close_project
create_project -force conv
#read_verilog [glob $DesignDir/syn/verilog/*.v]
add_files [glob $DesignDir/syn/verilog/*.v]
import_ip -name ConvNet_Arch_ap_fadd_2_full_dsp $DesignDir/ip.srcs/sources_1/ip/ConvNet_Arch_ap_fadd_2_full_dsp/ConvNet_Arch_ap_fadd_2_full_dsp.xci
import_ip -name ConvNet_Arch_ap_fmul_1_max_dsp $DesignDir/ip.srcs/sources_1/ip/ConvNet_Arch_ap_fmul_1_max_dsp/ConvNet_Arch_ap_fmul_1_max_dsp.xci
#import_ip  [glob $DesignDir/ip.srcs/sources_1/ip/*/*.xci]
#add_files [glob $DesignDir/ip.srcs/sources_1/ip/*/*.xci]
#read_vhdl [glob $DesignDir/ip.srcs/sources_1/ip/*/synth/*.vhd]
#set findcmd "find $DesignDir/ip.srcs/sources_1/ip/ -name *.vhd | grep -v sim"
#set filelist [exec $env(SHELL) -c $findcmd ]
#read_vhdl $filelist
#read_xdc $DesignDir/Constraints/SysClk.xdc
add_files $DesignDir/Constraints/SysClk.xdc
synth_design -top ConvNet_Arch_ap_fadd_2_full_dsp -part xc7vx485tffg1157-1 -mode out_of_context
write_checkpoint -force $DesignDir/tmp/ConvNet_Arch_ap_fadd_2_full_dsp.dcp
synth_design -top ConvNet_Arch_ap_fmul_1_max_dsp -part xc7vx485tffg1157-1 -mode out_of_context
write_checkpoint -force $DesignDir/tmp/ConvNet_Arch_ap_fmul_1_max_dsp.dcp
#write_checkpoint -noxdef ConvNet_Arch_ap_fadd_2_full_dsp.dcp
add_files $DesignDir/tmp/ConvNet_Arch_ap_fadd_2_full_dsp.dcp
add_file $DesignDir/tmp/ConvNet_Arch_ap_fmul_1_max_dsp.dcp
synth_design -top ConvNet_Arch -part xc7v2000tfhg1761-2l
#launch_runs synth_1
write_checkpoint -force $DesignDir/tmp/read_files_checkpoint.dcp
opt_design
power_opt_design
place_design

# Optionally run optimization if there are timing violations after placement
if {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
	puts "Found setup timing violations => running physical optimization"
	phys_opt_design
}

route_design
write_verilog -force $DesignDir/tmp/Convnet_impl_netlist.v -mode timesim -sdf_anno true -sdf_file $DesignDir/tmp/Convnet_impl_netlist.sdf
write_sdf -force $DesignDir/tmp/Convnet_impl_netlist.sdf -mode timesim
#write simulation batch
#TODO: Fixme 
set Line1 "add_wave \[get_objects\]\n"
set Line2 "open_saif $DesignDir/tmp/Convnet.saif\n"
set Line3 "log_saif \[get_objects -r\]"
set Line4 "run all\n"
set Line5 "close_saif\n"
set Line6 "close_sim -force\n"
set Line7 "quit\n"
set filename "$DesignDir/tmp/PowerSim.tcl"
set fileID [open $filename "w"]
puts -nonewline $fileID $Line1
puts $fileID $Line2
puts $fileID $Line3
puts $fileID $Line4
puts $fileID $Line5
puts $fileID $Line6
puts $fileID $Line7
close $fileID

exec xvlog $DesignDir/tb/Convnet_tb.v
exec xvlog $DesignDir/tmp/Convnet_impl_netlist.v
exec xvlog $DesignDir/tb/AESL_automem*.v
exec xvlog $XilinxLibDir/glbl.v
exec xelab -L simprims_ver Convnet_tb glbl -debug typical -snapshot Convnet_snapshot 
exec xsim Convnet_snapshot -tclbatch $DesignDir/tmp/PowerSim.tcl

#READ saif and report power
read_saif $DesignDir/tmp/Convnet.saif
report_power -hier all -file $DesignDir/report/convnet_power.rpt
close_design
close_project
exit
