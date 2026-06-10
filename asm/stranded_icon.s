	.section .text.s_08003538, "ax", %progbits
@ GetNextFreeIcon region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003538..0x0800355C
	.thumb
	.align 2, 0
	.global GetNextFreeIcon
	.thumb_func
GetNextFreeIcon:
	.incbin "data/residual/GetNextFreeIcon.bin"

