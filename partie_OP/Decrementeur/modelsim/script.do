vcom -work work ../../ANNOUAR_Meryem/partie_OP/Decrementeur/SRC/dec_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Decrementeur/test_bench/dec_1_tb.vhd
vsim work.dec_1_tb 
add wave sim:/dec_1_tb/*
run 
