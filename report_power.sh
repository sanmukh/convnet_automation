#!/bin/bash

#Assumption here is that generate_params.sh file has already been run and we have a directory structure corresponding to $SOLN in params directory

if [[ $# -lt 1 ]]
then
	echo "Usage: ./report_power.sh SolnName"
	exit -1
fi

SOLN=$1

vivado_hls rtlgen.tcl && vivado -mode tcl -source report_power.tcl

if [[ $? -ne 0 ]]
then
	echo "Error Occured."
	exit -1
fi

#copy reports from the reports directory to the params directory
cp ./convnet_automation/$SOLN/report/* ./params/$SOLN/

exit 0
