	.syntax unified
	.set InitTargets, 0x08050618 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.section .text.sub_8024F20, "ax", %progbits
@ sub_8024F20 @ JP 0x08024F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024F20
	.thumb_func
sub_8024F20:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl sub_8024E5C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

