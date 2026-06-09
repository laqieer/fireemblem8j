	.syntax unified
	.set sub_800BFC8, 0x0800BFC8 + 1
	.section .text.sub_800FE88, "ax", %progbits
@ sub_800FE88 @ JP 0x0800FE88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FE88
	.thumb_func
sub_800FE88:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrh r5, [r0, #2]
	adds r0, r5, #0
	bl sub_800BFC8
	adds r4, #0x44
	strh r5, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

