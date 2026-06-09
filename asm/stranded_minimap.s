	.section .text.s_080AC8DC, "ax", %progbits
@ Minimap_OnHBlank region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080AC8DC..0x080AC91C
	.thumb
	.align 2, 0
	.global Minimap_OnHBlank
	.thumb_func
Minimap_OnHBlank:
	.incbin "baserom.gba", 0xAC8DC, 0x40

