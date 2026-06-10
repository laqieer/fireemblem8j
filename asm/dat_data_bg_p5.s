	.section .rodata.dat_data_bg_p5, "a", %progbits
@ src/data/data_bg.o: region-same content at JP 0x0893e624 (US 0x088e57f4, shift -0xFFFA71D0); incbin baserom.gba
	.global bg_Serafew_Village_palette
bg_Serafew_Village_palette:
	.incbin "data/residual/bg_Serafew_Village_palette.bin"
	.global bg_Serafew_Flashback_palette
bg_Serafew_Flashback_palette:
	.incbin "data/residual/bg_Serafew_Flashback_palette.bin"
