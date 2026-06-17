	.syntax unified
	.set AiSetMovCostTableWithPassableWalls, 0x08040D4C + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set GenerateMovementMap, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.section .text.sub_8040E48, "ax", %progbits
@ sub_8040E48 @ JP 0x08040E48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040E48
	.thumb_func
sub_8040E48:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _08040E74 @ =0x0202E4DC
	ldr r0, [r0]
	bl sub_801B668
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040E74: .4byte 0x0202E4DC

