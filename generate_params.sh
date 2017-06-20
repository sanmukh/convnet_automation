#!/bin/bash
#use this script to generate the params.h file
if [[ $# -lt 1 ]]
then
	echo "Usage: ./generate_params.sh SolnName"
	exit -1
fi

SOLN=$1

LOC="./params/$SOLN"
AUTO_LOC="./convnet_automation/$SOLN/"

#echo $LOC
#params which we are required are



mkdir -p $AUTO_LOC/Constraints
echo "create_clock -period 10.0 -name SysClk -waveform {0.000 5.0} ap_clk" > $AUTO_LOC/Constraints/SysClk.xdc

#FIXME: generate or hardcode a testbench
mkdir -p $AUTO_LOC/tb

#generate a random input image
./generate_input.sh $SOLN


