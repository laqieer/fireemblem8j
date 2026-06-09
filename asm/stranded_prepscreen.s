	.section .text.s_08097634, "ax", %progbits
@ GetUnitFromPrepList region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08097634..0x08097644
	.thumb
	.align 2, 0
	.global GetUnitFromPrepList
	.thumb_func
GetUnitFromPrepList:
	.incbin "baserom.gba", 0x97634, 0x10

