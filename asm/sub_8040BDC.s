	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_8040B0C, 0x08040B0C + 1
	.set sub_8040B34, 0x08040B34 + 1
	.section .text.sub_8040BDC, "ax", %progbits
@ sub_8040BDC @ JP 0x08040BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040BDC
	.thumb_func
sub_8040BDC:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r6, #0
	ldr r4, _08040BF4 @ =0x03004DF0
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq _08040BF8
	movs r0, #0
	b _08040D42
	.align 2, 0
_08040BF4: .4byte 0x03004DF0
_08040BF8:
	adds r0, r1, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #4
	ble _08040C24
	ldr r3, [r4]
	ldrb r2, [r3, #0xa]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _08040C24
	movs r1, #8
	orrs r1, r2
	strb r1, [r3, #0xa]
	ldr r1, _08040C20 @ =0x0203AA00
	adds r1, #0x79
	strb r6, [r1]
	b _08040D42
	.align 2, 0
_08040C20: .4byte 0x0203AA00
_08040C24:
	ldr r0, _08040CAC @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _08040CBC
	ldr r4, _08040CB0 @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _08040C40
	movs r0, #0xc
	orrs r6, r0
_08040C40:
	ldr r0, [r4]
	add r7, sp, #0xc
	add r5, sp, #0x10
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8040B34
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040D40
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldr r2, _08040CB4 @ =0x0203AA00
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r6, #0
	str r6, [sp]
	movs r2, #0
	bl sub_803BA10
	ldr r4, _08040CB8 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _08040D40
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r6, [sp]
	bl sub_803BF60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040D40
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r6, [sp]
	ldrb r2, [r5]
	str r2, [sp, #4]
	ldrh r2, [r5, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	b _08040D26
	.align 2, 0
_08040CAC: .4byte 0x0202BCEC
_08040CB0: .4byte 0x03004DF0
_08040CB4: .4byte 0x0203AA00
_08040CB8: .4byte 0x0203AA90
_08040CBC:
	ldr r4, _08040D34 @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08040D40
	ldr r0, [r4]
	add r6, sp, #0xc
	adds r1, r6, #0
	bl sub_8040B0C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040D40
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _08040D38 @ =0x0203AA00
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl sub_803BA10
	ldr r4, _08040D3C @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _08040D40
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl sub_803BF60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040D40
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r5, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	ldrb r2, [r4, #3]
_08040D26:
	str r2, [sp, #8]
	movs r2, #0xd
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _08040D42
	.align 2, 0
_08040D34: .4byte 0x03004DF0
_08040D38: .4byte 0x0203AA00
_08040D3C: .4byte 0x0203AA90
_08040D40:
	movs r0, #0
_08040D42:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

