	.syntax unified
	.set sub_801E3A4, 0x0801E3A4 + 1
	.section .text.sub_80299C4, "ax", %progbits
@ sub_80299C4 @ JP 0x080299C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80299C4
	.thumb_func
sub_80299C4:
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_801E3A4
	pop {r1}
	bx r1

