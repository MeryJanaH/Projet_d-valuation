vcom -work work ../../ANNOUAR_Meryem/partie_CT/SRC/P_C.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_CT/test_bench/P_C_tb.vhd
vsim work.P_C_tb 
add wave sim:/P_C_tb/*
run 
