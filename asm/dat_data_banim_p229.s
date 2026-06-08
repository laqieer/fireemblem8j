	.section .rodata.dat_data_banim_p229, "a", %progbits
@ src/data/banim/data_banim.o: region-same content at JP 0x08763b10 (US 0x087327c4, shift -0xFFFCECB4); incbin baserom.gba
	.global Img_AuraBg1
Img_AuraBg1:
	.incbin "baserom.gba", 0x763B10, 0x978
	.global Pal_AuraBg1
Pal_AuraBg1:
	.incbin "baserom.gba", 0x764488, 0x20
