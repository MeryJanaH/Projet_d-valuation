vcom -work work ../../ANNOUAR_Meryem/partie_OP/Comparateur_0/SRC/comp_3bits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Comparateur_0/test_bench/comp_3bits_tb.vhd
vsim -novopt work.comp_3bits_tb 
add wave sim:/comp_3bits_tb/*
run 