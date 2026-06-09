	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.section .text.sub_801A0D4, "ax", %progbits
@ sub_801A0D4 @ JP 0x0801A0D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A0D4
	.thumb_func
sub_801A0D4:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0801A100 @ =0x0202E4DC
	ldr r1, [r0]
	ldr r0, _0801A104 @ =0x03004940
	str r1, [r0]
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
_0801A100: .4byte 0x0202E4DC
_0801A104: .4byte 0x03004940

