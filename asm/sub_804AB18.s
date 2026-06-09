	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_80498A4, 0x080498A4 + 1
	.set sub_804A0D4, 0x0804A0D4 + 1
	.set sub_804A14C, 0x0804A14C + 1
	.set sub_804A920, 0x0804A920 + 1
	.set sub_804AA0C, 0x0804AA0C + 1
	.set sub_804AA88, 0x0804AA88 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804AB18, "ax", %progbits
@ sub_804AB18 @ JP 0x0804AB18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AB18
	.thumb_func
sub_804AB18:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0804AC00 @ =0x080DEFA4
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, _0804AC04 @ =0x0203DD8C
	mov sb, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl sub_804AA0C
	ldr r4, _0804AC08 @ =0x085775CC
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl sub_804A920
	ldr r2, _0804AC0C @ =0x0202BE40
	mov r8, r2
	ldr r1, _0804AC10 @ =0x03001810
	mov r2, sb
	ldrb r0, [r2, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, _0804AC14 @ =0x03004DF0
	str r2, [r7]
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AC36
	mov r0, r8
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _0804AC18 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0804AC24
	adds r0, r2, #0
	bl sub_804AA88
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _0804AC24
	ldr r0, _0804AC1C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804ABA6
	movs r0, #0x69
	bl m4aSongNumStart
_0804ABA6:
	bl sub_807B4B8
	ldr r0, [r7]
	bl sub_807A888
	ldr r4, _0804AC20 @ =0x03001830
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r1, sp
	bl SetMuMoveScript
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl sub_804A0D4
	mov r1, sb
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl sub_804A920
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_804A14C
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804AD06
	.align 2, 0
_0804AC00: .4byte 0x080DEFA4
_0804AC04: .4byte 0x0203DD8C
_0804AC08: .4byte 0x085775CC
_0804AC0C: .4byte 0x0202BE40
_0804AC10: .4byte 0x03001810
_0804AC14: .4byte 0x03004DF0
_0804AC18: .4byte 0x085D31E8
_0804AC1C: .4byte 0x0202BCEC
_0804AC20: .4byte 0x03001830
_0804AC24:
	ldr r0, _0804AC64 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AC36
	movs r0, #0x6c
	bl m4aSongNumStart
_0804AC36:
	ldr r2, _0804AC68 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AC70
	ldr r0, _0804AC6C @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804AC70
	bl sub_807B4B8
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0804AD06
	.align 2, 0
_0804AC64: .4byte 0x0202BCEC
_0804AC68: .4byte 0x085775CC
_0804AC6C: .4byte 0x03004DF0
_0804AC70:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804ACA0
	bl sub_80498A4
	ldr r0, _0804AC9C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AD06
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0804AD06
	.align 2, 0
_0804AC9C: .4byte 0x0202BCEC
_0804ACA0:
	ldr r0, _0804AD18 @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetCursorMapPosition
	bl sub_8000CD8
	subs r0, #1
	ldr r6, _0804AD1C @ =0x03001828
	ldr r1, [r6]
	cmp r0, r1
	bne _0804ACD6
	ldr r0, _0804AD20 @ =0x03001824
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_0804ACD6:
	ldr r0, _0804AD20 @ =0x03001824
	strh r5, [r0]
	strh r4, [r0, #2]
	bl sub_8000CD8
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl sub_8015AB4
	ldr r0, _0804AD24 @ =0x0203DD8C
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq _0804AD06
	ldr r0, _0804AD28 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AD06
	movs r0, #0x65
	bl m4aSongNumStart
_0804AD06:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD18: .4byte 0x03004DF0
_0804AD1C: .4byte 0x03001828
_0804AD20: .4byte 0x03001824
_0804AD24: .4byte 0x0203DD8C
_0804AD28: .4byte 0x0202BCEC

