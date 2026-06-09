	.syntax unified
	.set AiSetMovCostTableWithPassableTerrain, 0x08040D84 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.section .text.sub_8040F3C, "ax", %progbits
@ sub_8040F3C @ JP 0x08040F3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040F3C
	.thumb_func
sub_8040F3C:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl AiSetMovCostTableWithPassableTerrain
	ldr r0, _08040F68 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl sub_801A1B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F68: .4byte 0x0202E4E0

