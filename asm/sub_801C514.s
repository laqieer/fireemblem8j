	.syntax unified
	.set HandleMoveCameraWithMapCursor, 0x080158A8 + 1
	.set HandleMoveMapCursor, 0x08015854 + 1
	.set sub_8015730, 0x08015730 + 1
	.section .text.sub_801C514, "ax", %progbits
@ sub_801C514 @ JP 0x0801C514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C514
	.thumb_func
sub_801C514:
	push {lr}
	ldr r2, _0801C544 @ =0x085775CC
	ldr r3, [r2]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C550
	ldr r0, _0801C548 @ =0x0202BCAC
	ldr r0, [r0, #0x20]
	ldr r1, _0801C54C @ =0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0801C550
	ldrh r0, [r3, #0x10]
	bl sub_8015730
	movs r0, #8
	bl HandleMoveMapCursor
	movs r0, #8
	bl HandleMoveCameraWithMapCursor
	b _0801C564
	.align 2, 0
_0801C544: .4byte 0x085775CC
_0801C548: .4byte 0x0202BCAC
_0801C54C: .4byte 0x00070007
_0801C550:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	bl sub_8015730
	movs r0, #4
	bl HandleMoveMapCursor
	movs r0, #4
	bl HandleMoveCameraWithMapCursor
_0801C564:
	ldr r1, _0801C584 @ =0x0202BCAC
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C580
	ldr r0, _0801C588 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	ldr r0, _0801C58C @ =0x0000FCF4
	ands r0, r1
	strh r0, [r2, #8]
_0801C580:
	pop {r0}
	bx r0
	.align 2, 0
_0801C584: .4byte 0x0202BCAC
_0801C588: .4byte 0x085775CC
_0801C58C: .4byte 0x0000FCF4

