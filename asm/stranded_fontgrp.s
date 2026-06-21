	.section .text.s_0800391C, "ax", %progbits
@ PrintStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800391C..0x08003988
	.thumb
	.align 2, 0
	.global PrintStringToDBG
	.thumb_func
PrintStringToDBG:
	.incbin "data/residual/PrintStringToDBG.bin"

	.section .text.s_08003A08, "ax", %progbits
@ UpdateDBGScroll region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003A08..0x08003A70
	.thumb
	.align 2, 0
	.global UpdateDBGScroll
	.thumb_func
UpdateDBGScroll:
	.incbin "data/residual/UpdateDBGScroll.bin"
