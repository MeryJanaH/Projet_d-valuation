vcom -work work ../../ANNOUAR_Meryem/test/Multiplieur/src/Multip_16bits.vhd
vcom -work work ../../ANNOUAR_Meryem/test/Multiplieur/test_bench/Multip_16bits_tb.vhd
vsim -novopt work.Multip_16bits_tb 
add wave sim:/Multip_16bits_tb/*
run 