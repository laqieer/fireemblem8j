	.section .text.s_08001044, "ax", %progbits
@ ApplyColorAddition_ClampMax region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001044..0x080010A0
	.thumb
	.align 2, 0
	.global ApplyColorAddition_ClampMax
	.thumb_func
ApplyColorAddition_ClampMax:
	.incbin "baserom.gba", 0x1044, 0x5C

	.section .text.s_080010A0, "ax", %progbits
@ ApplyColorAddition_ClampMin region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080010A0..0x080010FC
	.thumb
	.align 2, 0
	.global ApplyColorAddition_ClampMin
	.thumb_func
ApplyColorAddition_ClampMin:
	.incbin "baserom.gba", 0x10A0, 0x5C

