	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8098FF4, "ax", %progbits
@ sub_8098FF4 @ JP 0x08098FF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098FF4
	.thumb_func
sub_8098FF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl sub_80B1FBC
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08099068
	ldr r2, _08099064 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08099058
	b _08099170
_08099058:
	bl sub_808B2A4
	movs r0, #0
	strb r0, [r6]
	b _08099218
	.align 2, 0
_08099064: .4byte 0x085775CC
_08099068:
	ldr r1, _08099090 @ =0x085775CC
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _08099094
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _08099082
	b _08099218
_08099082:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _08099218
	.align 2, 0
_08099090: .4byte 0x085775CC
_08099094:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _080990DC
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08099158
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08099158
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl sub_80D65C0
	ldr r0, _080990D8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080990D0
	b _08099218
_080990D0:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099218
	.align 2, 0
_080990D8: .4byte 0x0202BCEC
_080990DC:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809911C
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _080990EC
	b _08099218
_080990EC:
	ldr r0, [r4, #0x14]
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099158
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08099118 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809910E
	b _08099218
_0809910E:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099218
	.align 2, 0
_08099118: .4byte 0x0202BCEC
_0809911C:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08099170
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _08099218
	ldr r0, [r4, #0x14]
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099158
	ldr r0, _08099154 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099148
	movs r0, #0x6a
	bl m4aSongNumStart
_08099148:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _08099218
	.align 2, 0
_08099154: .4byte 0x0202BCEC
_08099158:
	ldr r0, _0809916C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099218
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099218
	.align 2, 0
_0809916C: .4byte 0x0202BCEC
_08099170:
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _0809919C
	ldrb r0, [r5]
	cmp r0, #0
	bne _08099198
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0809919C
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_08099198:
	subs r0, #1
	strb r0, [r5]
_0809919C:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080991CA
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080991BC
	adds r0, r1, #1
	b _080991C8
_080991BC:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080991CA
	movs r0, #0
_080991C8:
	strb r0, [r5]
_080991CA:
	ldrb r0, [r5]
	cmp sb, r0
	beq _08099218
	ldr r0, _08099224 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080991E2
	movs r0, #0x66
	bl m4aSongNumStart
_080991E2:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08099218
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_08099218:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099224: .4byte 0x0202BCEC

