	.section .rodata.dat_ending_staffreel_p4, "a", %progbits
@ src/data/ending/ending_staffreel.o: region-same content at JP 0x08ad1284 (US 0x08a4cf2c, shift -0xFFF7BCA8); incbin baserom.gba
	.global gGfx_BrownTextBox
gGfx_BrownTextBox:
	.incbin "graphics/misc_gfx2/gGfx_BrownTextBox.bin.lz"
	.global gPal_BrownTextBox
gPal_BrownTextBox:
	.incbin "graphics/misc_gfx2/gPal_BrownTextBox.gbapal"
