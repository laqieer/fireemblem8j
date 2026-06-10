	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.section .text.sub_801A05C, "ax", %progbits
@ sub_801A05C @ JP 0x0801A05C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A05C
	.thumb_func
sub_801A05C:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0801A094 @ =0x0202E4DC
	ldr r1, [r0]
	ldr r0, _0801A098 @ =0x03004940
	str r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl sub_801A1B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A094: .4byte 0x0202E4DC
_0801A098: .4byte 0x03004940

