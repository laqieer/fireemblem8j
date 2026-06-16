	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioTeamList_SetTeamSpriteXOffsets, 0x08044200 + 1
	.section .text.sub_80442A8, "ax", %progbits
@ SioTeamList_2 @ JP 0x080442A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioTeamList_2
	.thumb_func
SioTeamList_2:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _08044318 @ =0x080DED3D
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r7, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	cmp r5, r8
	bne _080442D0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080442D0:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08044320
	ldr r3, _0804431C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	str r0, [r6, #0x48]
	b _08044334
	.align 2, 0
_08044318: .4byte 0x080DED3D
_0804431C: .4byte 0x03003020
_08044320:
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r1, r7, #0
	bl SioTeamList_SetTeamSpriteXOffsets
_08044334:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

