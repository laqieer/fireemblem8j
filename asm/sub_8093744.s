	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8089094, 0x08089094 + 1
	.set sub_8093604, 0x08093604 + 1
	.set sub_80936B0, 0x080936B0 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.section .text.sub_8093744, "ax", %progbits
@ sub_8093744 @ JP 0x08093744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093744
	.thumb_func
sub_8093744:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0809376C @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _08093770
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _08093776
	.align 2, 0
_0809376C: .4byte 0x085775CC
_08093770:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_08093776:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08093798
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08093AC2
_08093798:
	movs r1, #1
	mov sb, r1
	mov r6, sb
	ands r6, r4
	cmp r6, #0
	beq _08093804
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _080937C0
	cmp r0, #1
	bgt _080937B8
	cmp r0, #0
	beq _080937C8
	b _08093AC2
_080937B8:
	cmp r0, #3
	bne _080937BE
	b _080938B6
_080937BE:
	b _08093AC2
_080937C0:
	adds r0, r5, #0
	bl sub_8093604
	b _08093AC2
_080937C8:
	ldr r1, _080937FC @ =0x0200D6E0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8089094
	ldr r0, _08093800 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080937F4
	movs r0, #0x6a
	bl m4aSongNumStart
_080937F4:
	adds r0, r5, #0
	bl sub_8002DE4
	b _08093AC2
	.align 2, 0
_080937FC: .4byte 0x0200D6E0
_08093800: .4byte 0x0202BCEC
_08093804:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _08093898
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _08093858
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _08093828
	b _08093AC2
_08093828:
	ldr r1, _08093850 @ =0x0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80936B0
	ldrb r1, [r4]
	ldr r2, _08093854 @ =0x02022CA8
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _080938D8
	.align 2, 0
_08093850: .4byte 0x0200D6E0
_08093854: .4byte 0x02022CA8
_08093858:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _08093864
	b _08093AC2
_08093864:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _08093894 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809388A
	b _08093AC2
_0809388A:
	movs r0, #0x6f
	bl m4aSongNumStart
	b _08093AC2
	.align 2, 0
_08093894: .4byte 0x0202BCEC
_08093898:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0809392C
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _080938E8
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _080938B6
	b _08093AC2
_080938B6:
	ldr r1, _080938E0 @ =0x0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_80936B0
	ldrb r1, [r4]
	ldr r2, _080938E4 @ =0x02022CA8
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_080938D8:
	adds r0, r5, #0
	bl sub_80945E8
	b _08093AC2
	.align 2, 0
_080938E0: .4byte 0x0200D6E0
_080938E4: .4byte 0x02022CA8
_080938E8:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080938FA
	b _08093AC2
_080938FA:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _08093928 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809391C
	movs r0, #0x6f
	bl m4aSongNumStart
_0809391C:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _08093AC2
	.align 2, 0
_08093928: .4byte 0x0202BCEC
_0809392C:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0809394C
	ldrh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08093A0E
	ldrh r1, [r3, #0x10]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08093A0E
_0809394C:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _08093980
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _08093960
	b _08093AC2
_08093960:
	ldr r0, _0809397C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093972
	movs r0, #0x66
	bl m4aSongNumStart
_08093972:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _08093AC2
	.align 2, 0
_0809397C: .4byte 0x0202BCEC
_08093980:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _08093A00 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093996
	movs r0, #0x66
	bl m4aSongNumStart
_08093996:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _08093A08
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	cmp r0, #0
	beq _08093A08
	cmp r1, #0
	bne _080939B8
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_080939B8:
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08093A04 @ =0x02022CA8
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, sb
	str r0, [sp]
	adds r0, r5, #0
	bl sub_80945E8
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	ldrh r2, [r5, #0x3e]
	subs r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	cmp r0, #0
	bne _08093AC2
	b _08093ABE
	.align 2, 0
_08093A00: .4byte 0x0202BCEC
_08093A04: .4byte 0x02022CA8
_08093A08:
	ldrb r0, [r4]
	subs r0, #1
	b _08093AC0
_08093A0E:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08093A34
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08093AC2
	ldrh r1, [r2, #0x10]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08093AC2
_08093A34:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _08093AB0 @ =0x0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08093AC2
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _08093AB4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093A5A
	movs r0, #0x66
	bl m4aSongNumStart
_08093A5A:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #4
	bne _08093ABC
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _08093ABC
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08093AB8 @ =0x02022CA8
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_80945E8
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r1, r8
	ldrb r2, [r1]
	lsls r2, r2, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	b _08093AC2
	.align 2, 0
_08093AB0: .4byte 0x0200F158
_08093AB4: .4byte 0x0202BCEC
_08093AB8: .4byte 0x02022CA8
_08093ABC:
	ldrb r0, [r4]
_08093ABE:
	adds r0, #1
_08093AC0:
	strb r0, [r4]
_08093AC2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

