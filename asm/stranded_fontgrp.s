	.section .text.s_08003800, "ax", %progbits
@ PrintEmptyStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003800..0x08003814
	.thumb
	.align 2, 0
	.global PrintEmptyStringToDBG
	.thumb_func
PrintEmptyStringToDBG:
	.incbin "baserom.gba", 0x3800, 0x14

