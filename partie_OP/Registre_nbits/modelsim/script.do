vcom -work work ../../ANNOUAR_Meryem/partie_OP/Registre_nbits/SRC/registre_nbits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Registre_nbits/test_bench/registre_nbits_tb.vhd
vsim work.registre_nbits_tb 
add wave sim:/registre_nbits_tb/*
run 