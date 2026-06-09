	.syntax unified
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.section .text.sub_801915C, "ax", %progbits
@ sub_801915C @ JP 0x0801915C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801915C
	.thumb_func
sub_801915C:
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl UnitRemoveInvalidItems
	pop {r0}
	bx r0
	.align 2, 0

