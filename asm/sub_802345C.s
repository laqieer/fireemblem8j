	.syntax unified
	.set sub_801E3A4, 0x0801E3A4 + 1
	.section .text.sub_802345C, "ax", %progbits
@ sub_802345C @ JP 0x0802345C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802345C
	.thumb_func
sub_802345C:
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_801E3A4
	pop {r1}
	bx r1

