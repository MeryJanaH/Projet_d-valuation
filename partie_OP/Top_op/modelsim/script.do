vcom -work work ../../ANNOUAR_Meryem/partie_OP/Comparateur_0/SRC/comp_3bits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Decrementeur/SRC/dec_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Multiplieur/SRC/Multip_16bits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Mux2_1/SRC/Mux2_1.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Registre_nbits/SRC/registre_nbits.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Top_op/src/top_op.vhd
vcom -work work ../../ANNOUAR_Meryem/partie_OP/Top_op/test_bench/top_op_tb.vhd
vsim -novopt work.top_op_tb 
add wave sim:/top_op_tb/*
run 