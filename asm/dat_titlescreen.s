	.section .rodata.dat_titlescreen, "a", %progbits
@ src/titlescreen.o: region-same content at JP 0x08b3ee00 (US 0x08aa682c, shift -0x-985D4); incbin baserom.gba
	.global gTitlescreen_0
gTitlescreen_0:
	.incbin "data/residual/gTitlescreen_0.bin"
	.global gTitlescreen_1
gTitlescreen_1:
	.incbin "data/residual/gTitlescreen_1.bin"
