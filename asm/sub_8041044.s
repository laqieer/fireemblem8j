	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.section .text.sub_8041044, "ax", %progbits
@ sub_8041044 @ JP 0x08041044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041044
	.thumb_func
sub_8041044:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _08041074 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl sub_801A1B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041074: .4byte 0x0202E4E0

