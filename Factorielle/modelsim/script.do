vcom -work work ../../ANNOUAR_Meryem/partie_OP/Comparateur_0/SRC/comp_3bits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Decrementeur/SRC/dec_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Multiplieur/SRC/Multip_16bits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Mux2_1/SRC/Mux2_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Registre_nbits/SRC/registre_nbits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Top_op/src/top_op.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_CT/SRC/P_C.vhd
vcom -work work ../../ANNOUAR_Meryem/Factorielle/test_bench/factorielle_tb.vhd
vsim work.factorielle_tb 
add wave sim:/factorielle_tb/*
run 