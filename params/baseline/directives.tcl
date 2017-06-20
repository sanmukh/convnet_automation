############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
set_directive_resource -core ROM_1P "ConvNet_Arch" kernel_1
set_directive_unroll -skip_exit_check "Conv_2d_C1/col_loop_1"
set_directive_unroll -skip_exit_check "Conv_2d_C1/row_loop_1"
set_directive_unroll "Horz_Array_C1/horizontal_array"
set_directive_unroll -skip_exit_check "Conv_2d_C1/vertical_array"
set_directive_pipeline "Conv_2d_C1/vertical_array"
