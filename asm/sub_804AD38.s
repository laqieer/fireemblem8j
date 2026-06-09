	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_80498A4, 0x080498A4 + 1
	.set sub_804A0D4, 0x0804A0D4 + 1
	.set sub_804A14C, 0x0804A14C + 1
	.set sub_804A1CC, 0x0804A1CC + 1
	.set sub_804A920, 0x0804A920 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804AD38, "ax", %progbits
@ sub_804AD38 @ JP 0x0804AD38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AD38
	.thumb_func
sub_804AD38:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0804AE14 @ =0x0203DD8C
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, _0804AE18 @ =0x085775CC
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl sub_804A920
	ldr r2, _0804AE1C @ =0x0202BE40
	mov sl, r2
	ldr r0, _0804AE20 @ =0x03001810
	mov sb, r0
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, _0804AE24 @ =0x03004DF0
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetCursorMapPosition
	bl sub_8000CD8
	subs r0, #1
	ldr r7, _0804AE28 @ =0x03001828
	ldr r1, [r7]
	cmp r0, r1
	bne _0804ADA4
	ldr r0, _0804AE2C @ =0x03001824
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_0804ADA4:
	ldr r0, _0804AE2C @ =0x03001824
	strh r5, [r0]
	strh r4, [r0, #2]
	bl sub_8000CD8
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_8015AB4
	ldr r2, _0804AE18 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AE34
	ldr r0, _0804AE30 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804ADDA
	movs r0, #0x69
	bl m4aSongNumStart
_0804ADDA:
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_804A1CC
	ldrb r0, [r6, #5]
	add r0, sb
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl sub_804A14C
	bl sub_80498A4
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b _0804AEE4
	.align 2, 0
_0804AE14: .4byte 0x0203DD8C
_0804AE18: .4byte 0x085775CC
_0804AE1C: .4byte 0x0202BE40
_0804AE20: .4byte 0x03001810
_0804AE24: .4byte 0x03004DF0
_0804AE28: .4byte 0x03001828
_0804AE2C: .4byte 0x03001824
_0804AE30: .4byte 0x0202BCEC
_0804AE34:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804AE9C
	ldr r0, _0804AE94 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AE4E
	movs r0, #0x6b
	bl m4aSongNumStart
_0804AE4E:
	ldr r0, _0804AE98 @ =0x03001830
	ldr r0, [r0]
	bl sub_807B4C8
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	bl sub_804A0D4
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl sub_804A14C
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _0804AEE4
	.align 2, 0
_0804AE94: .4byte 0x0202BCEC
_0804AE98: .4byte 0x03001830
_0804AE9C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AEC8
	ldr r1, _0804AEC4 @ =0x03004DF0
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804AEC8
	bl sub_807B4B8
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b _0804AEE4
	.align 2, 0
_0804AEC4: .4byte 0x03004DF0
_0804AEC8:
	ldr r0, _0804AEF4 @ =0x0203DD8C
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq _0804AEE4
	ldr r0, _0804AEF8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AEE4
	movs r0, #0x65
	bl m4aSongNumStart
_0804AEE4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AEF4: .4byte 0x0203DD8C
_0804AEF8: .4byte 0x0202BCEC

