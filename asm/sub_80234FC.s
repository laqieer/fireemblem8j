	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_804FCAC, 0x0804FCAC + 1
	.section .text.sub_80234FC, "ax", %progbits
@ sub_80234FC @ JP 0x080234FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80234FC
	.thumb_func
sub_80234FC:
	push {lr}
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	bl sub_804FCAC
	movs r0, #0x31
	pop {r1}
	bx r1
	.align 2, 0

