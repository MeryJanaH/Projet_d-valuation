vcom -work work ../../ANNOUAR_Meryem/partie_OP/Mux2_1/SRC/Mux2_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Mux2_1/test_bench/Mux2_1_tb.vhd
vsim  -novopt work.mux2_1_tb 
add wave sim:/mux2_1_tb/*
run 