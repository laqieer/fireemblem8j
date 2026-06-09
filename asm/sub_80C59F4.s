	.syntax unified
	.set InitText, 0x08003C8C + 1
	.section .text.sub_80C59F4, "ax", %progbits
@ sub_80C59F4 @ JP 0x080C59F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C59F4
	.thumb_func
sub_80C59F4:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x34
	movs r1, #8
	bl InitText
	adds r4, #0x3c
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	pop {r4}
	pop {r0}
	bx r0

