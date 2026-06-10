	.section .text.s_08092604, "ax", %progbits
@ UnitList_RegisterEquippedIcon region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08092604..0x08092638
	.thumb
	.align 2, 0
	.global UnitList_RegisterEquippedIcon
	.thumb_func
UnitList_RegisterEquippedIcon:
	.incbin "data/residual/UnitList_RegisterEquippedIcon.bin"

