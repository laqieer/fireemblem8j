	.section .text.s_080DA918, "ax", %progbits
@ abort region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA918..0x080DA938
	.thumb
	.align 2, 0
	.global abort
	.thumb_func
abort:
	.incbin "data/residual/abort.bin"
