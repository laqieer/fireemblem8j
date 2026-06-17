	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set GenerateMovementMap, 0x0801A1B8 + 1
	.section .text.sub_801A09C, "ax", %progbits
@ sub_801A09C @ JP 0x0801A09C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A09C
	.thumb_func
sub_801A09C:
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r1, #0x18
	asrs r5, r5, #0x18
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0801A0CC @ =0x0202E4DC
	ldr r1, [r0]
	ldr r0, _0801A0D0 @ =0x03004940
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r2, r5, #0
	bl GenerateMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0CC: .4byte 0x0202E4DC
_0801A0D0: .4byte 0x03004940

