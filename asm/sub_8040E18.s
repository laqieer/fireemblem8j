	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.section .text.sub_8040E18, "ax", %progbits
@ sub_8040E18 @ JP 0x08040E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040E18
	.thumb_func
sub_8040E18:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _08040E44 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl sub_801A1B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040E44: .4byte 0x0202E4E0

