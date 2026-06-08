	.section .rodata.dat_ending_staffreel_p4, "a", %progbits
@ src/data/ending/ending_staffreel.o: region-same content at JP 0x08ad1284 (US 0x08a4cf2c, shift -0xFFF7BCA8); incbin baserom.gba
	.global gGfx_BrownTextBox
gGfx_BrownTextBox:
	.incbin "baserom.gba", 0xAD1284, 0x1A0
	.global gPal_BrownTextBox
gPal_BrownTextBox:
	.incbin "baserom.gba", 0xAD1424, 0x20
