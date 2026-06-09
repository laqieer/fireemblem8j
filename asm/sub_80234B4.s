	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.section .text.sub_80234B4, "ax", %progbits
@ sub_80234B4 @ JP 0x080234B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80234B4
	.thumb_func
sub_80234B4:
	push {lr}
	movs r0, #0
	bl SetTextFont
	pop {r0}
	bx r0

