	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_801D180, 0x0801D180 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_801D2CC, "ax", %progbits
@ sub_801D2CC @ JP 0x0801D2CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D2CC
	.thumb_func
sub_801D2CC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801D2E8 @ =0x03004DF0
	ldr r2, [r5]
	cmp r2, #0
	bne _0801D2EC
	bl sub_80310F4
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801D358
	.align 2, 0
_0801D2E8: .4byte 0x03004DF0
_0801D2EC:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0801D344 @ =0x0202E4D4
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl sub_80310F4
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_801D180
	cmp r0, #2
	beq _0801D348
	cmp r0, #3
	beq _0801D350
	b _0801D358
	.align 2, 0
_0801D344: .4byte 0x0202E4D4
_0801D348:
	ldr r0, [r5]
	bl sub_80280A0
	b _0801D358
_0801D350:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0801D358:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

