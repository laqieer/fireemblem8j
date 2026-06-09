	.syntax unified
	.set InitBmBgLayers, 0x08015624 + 1
	.set ResetMuAnims, 0x0807B5A4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set sub_800D45C, 0x0800D45C + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DF00, 0x0807DF00 + 1
	.section .text.sub_807CBC4, "ax", %progbits
@ sub_807CBC4 @ JP 0x0807CBC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CBC4
	.thumb_func
sub_807CBC4:
	push {lr}
	bl ResetMuAnims
	bl ResetTextFont
	bl sub_807DF00
	bl InitBmBgLayers
	bl sub_804F8F4
	bl sub_801569C
	bl sub_800D45C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CBEC
	bl sub_807B4B8
_0807CBEC:
	pop {r0}
	bx r0

