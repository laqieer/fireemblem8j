	.section .text.s_0809FB74, "ax", %progbits
@ PrepItemSupply_DrawConvoyWeaponIconTiles region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0809FB74..0x0809FBB4
	.thumb
	.align 2, 0
	.global PrepItemSupply_DrawConvoyWeaponIconTiles
	.thumb_func
PrepItemSupply_DrawConvoyWeaponIconTiles:
	.incbin "baserom.gba", 0x9FB74, 0x40

