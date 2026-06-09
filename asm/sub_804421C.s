	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioTeamList_SetTeamSpriteXOffsets, 0x08044200 + 1
	.section .text.sub_804421C, "ax", %progbits
@ sub_804421C @ JP 0x0804421C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804421C
	.thumb_func
sub_804421C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, [r4, #0x2c]
	ldr r0, _08044284 @ =0x080DED3D
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r6, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0804423E
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0804423E:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0804428C
	ldr r3, _08044288 @ =0x03003020
	ldrb r2, [r3, #0x10]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _080442A0
	.align 2, 0
_08044284: .4byte 0x080DED3D
_08044288: .4byte 0x03003020
_0804428C:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r7, #0
	adds r1, r6, #0
	bl SioTeamList_SetTeamSpriteXOffsets
_080442A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

