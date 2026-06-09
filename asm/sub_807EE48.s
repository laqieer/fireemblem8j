	.syntax unified
	.set InitBmBgLayers, 0x08015624 + 1
	.set ResetMuAnims, 0x0807B5A4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_807DF00, 0x0807DF00 + 1
	.section .text.sub_807EE48, "ax", %progbits
@ sub_807EE48 @ JP 0x0807EE48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807EE48
	.thumb_func
sub_807EE48:
	push {lr}
	bl ResetMuAnims
	bl ResetTextFont
	bl sub_807DF00
	bl InitBmBgLayers
	bl sub_804F8E0
	bl sub_801569C
	pop {r0}
	bx r0
	.align 2, 0

