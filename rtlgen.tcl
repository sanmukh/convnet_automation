#Certain solution specific variables. 
#TODO: pickup from commandline args
variable SOLN baseline

#Common to all simulations
open_project convnet_automation
set_top ConvNet_Arch
add_files $::env(HOME)/Dropbox/USC/tapas/Design_Space_Exporation/FPGA15/ConvNet/ConvNet.c
add_files $::env(HOME)/Dropbox/USC/tapas/Design_Space_Exporation/FPGA15/ConvNet/ConvNet.h
add_files $::env(HOME)/Dropbox/USC/tapas/Design_Space_Exporation/FPGA15/ConvNet/conv_kernel.c
add_files $::env(HOME)/Dropbox/USC/tapas/Design_Space_Exporation/FPGA15/ConvNet/conv_kernel.h
add_files -tb $::env(HOME)/Dropbox/USC/tapas/Design_Space_Exporation/FPGA15/ConvNet/ConvNet_test.c

#Parameter specific
add_files ./params/$SOLN/params.h
open_solution $SOLN
set_part {xc7v2000tfhg1761-2l}
create_clock -period 10 -name default
source "./params/$SOLN/directives.tcl"
csynth_design

