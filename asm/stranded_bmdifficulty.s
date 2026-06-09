	.section .text.s_08037C44, "ax", %progbits
@ DungeonRecordUi_InitText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08037C44..0x08037CD8
	.thumb
	.align 2, 0
	.global DungeonRecordUi_InitText
	.thumb_func
DungeonRecordUi_InitText:
	.incbin "baserom.gba", 0x37C44, 0x94

