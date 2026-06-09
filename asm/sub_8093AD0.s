	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_8092518, 0x08092518 + 1
	.set sub_8092638, 0x08092638 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.set sub_8094ED0, 0x08094ED0 + 1
	.section .text.sub_8093AD0, "ax", %progbits
@ sub_8093AD0 @ JP 0x08093AD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093AD0
	.thumb_func
sub_8093AD0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _08093B04 @ =0x085775CC
	cmp r0, #0
	beq _08093B08
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093B08
	bl sub_808B2A4
	movs r0, #0
	strb r0, [r4]
	b _08093D98
	.align 2, 0
_08093B04: .4byte 0x085775CC
_08093B08:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093BF0
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093BF0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08093B90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _08093B42
	movs r0, #0x6a
	bl m4aSongNumStart
_08093B42:
	ldr r2, _08093B94 @ =0x08A93994
	adds r5, r7, #0
	adds r5, #0x2d
	adds r6, r7, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl sub_8094ED0
	lsls r0, r0, #0x18
	mov sb, r4
	movs r1, #0x34
	adds r1, r1, r7
	mov sl, r1
	adds r1, r7, #0
	adds r1, #0x35
	str r1, [sp, #8]
	cmp r0, #0
	beq _08093BC4
	movs r4, #0
	b _08093BB0
	.align 2, 0
_08093B90: .4byte 0x0202BCEC
_08093B94: .4byte 0x08A93994
_08093B98:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _08093BE8 @ =0x02022CA8
	bl sub_80945E8
	adds r4, #1
	cmp r4, #5
	bgt _08093BB8
_08093BB0:
	ldr r0, _08093BEC @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08093B98
_08093BB8:
	ldrh r0, [r7, #0x3e]
	bl sub_8092638
	movs r0, #1
	bl BG_EnableSyncByMask
_08093BC4:
	mov r1, sb
	ldrb r0, [r1]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r5]
	ldr r1, [sp, #8]
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, [sp, #4]
	cmp r0, r1
	bne _08093BDE
	b _08093D98
_08093BDE:
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8092518
	b _08093D98
	.align 2, 0
_08093BE8: .4byte 0x02022CA8
_08093BEC: .4byte 0x0200F158
_08093BF0:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08093C2C
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _08093C2C
	ldr r0, _08093C28 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093C18
	movs r0, #0x66
	bl m4aSongNumStart
_08093C18:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _08093D98
	.align 2, 0
_08093C28: .4byte 0x0202BCEC
_08093C2C:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08093CC2
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	bne _08093CBC
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _08093C5A
	b _08093D98
_08093C5A:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _08093C66
	b _08093D98
_08093C66:
	ldr r0, _08093CB4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093C78
	movs r0, #0x6f
	bl m4aSongNumStart
_08093C78:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _08093CB8 @ =0x08A93994
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08093CAE
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_08093CA0:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _08093CAE
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08093CA0
_08093CAE:
	strb r4, [r5]
	b _08093D2A
	.align 2, 0
_08093CB4: .4byte 0x0202BCEC
_08093CB8: .4byte 0x08A93994
_08093CBC:
	subs r0, #1
	strb r0, [r1]
	b _08093D3E
_08093CC2:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08093D58
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r3, r7, #0
	adds r3, #0x2d
	ldrb r0, [r3]
	adds r6, r7, #0
	adds r6, #0x2f
	cmp r0, #8
	beq _08093CF6
	ldr r2, _08093D34 @ =0x08A93994
	adds r4, r0, #1
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08093D3C
_08093CF6:
	adds r1, r7, #0
	adds r1, #0x2e
	ldrb r0, [r6]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08093D98
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08093D98
	strb r5, [r3]
	ldr r0, _08093D38 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093D20
	movs r0, #0x6f
	bl m4aSongNumStart
_08093D20:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08093D2A:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _08093D98
	.align 2, 0
_08093D34: .4byte 0x08A93994
_08093D38: .4byte 0x0202BCEC
_08093D3C:
	strb r4, [r3]
_08093D3E:
	ldr r0, _08093D54 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093D98
	movs r0, #0x67
	bl m4aSongNumStart
	b _08093D98
	.align 2, 0
_08093D54: .4byte 0x0202BCEC
_08093D58:
	ldrh r1, [r2, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093D98
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _08093D98
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08093DA8 @ =0x08A93994
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_08093D98:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093DA8: .4byte 0x08A93994

