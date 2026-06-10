	.section .text.s_08097634, "ax", %progbits
@ GetUnitFromPrepList region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08097634..0x08097644
	.thumb
	.align 2, 0
	.global GetUnitFromPrepList
	.thumb_func
GetUnitFromPrepList:
	.incbin "data/residual/GetUnitFromPrepList.bin"

	.section .text.s_08097644, "ax", %progbits
@ RegisterPrepUnitList region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08097644..0x08097654
	.thumb
	.align 2, 0
	.global RegisterPrepUnitList
	.thumb_func
RegisterPrepUnitList:
	.incbin "data/residual/RegisterPrepUnitList.bin"

	.section .text.s_08097654, "ax", %progbits
@ PrepGetUnitAmount region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08097654..0x08097664
	.thumb
	.align 2, 0
	.global PrepGetUnitAmount
	.thumb_func
PrepGetUnitAmount:
	.incbin "data/residual/PrepGetUnitAmount.bin"

	.section .text.s_08097664, "ax", %progbits
@ PrepSetUnitAmount region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08097664..0x08097674
	.thumb
	.align 2, 0
	.global PrepSetUnitAmount
	.thumb_func
PrepSetUnitAmount:
	.incbin "data/residual/PrepSetUnitAmount.bin"

