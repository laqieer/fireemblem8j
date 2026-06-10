	.section .rodata.dat_trig_rodata, "a", %progbits
	.align 2
@ src/data/trig_rodata.o: region-same content at JP 0x080dc15c (US 0x080d751c, shift -0x-4C40); incbin baserom.gba
	.global gSinLookup
gSinLookup:
	.incbin "data/residual/gSinLookup.bin"
