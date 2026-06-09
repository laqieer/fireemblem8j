	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_FindUnitSlot, 0x0804A1A4 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_804A1CC, "ax", %progbits
@ sub_804A1CC @ JP 0x0804A1CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A1CC
	.thumb_func
sub_804A1CC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0804A2C0 @ =0x080DEF8F
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, _0804A2C4 @ =0x080DEF97
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl LinkArenaBattleMap_FindUnitSlot
	adds r4, r0, #0
	movs r1, #5
	bl sub_80D6374
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, _0804A2C8 @ =0x03001810
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _0804A248
	adds r0, r5, #0
	bl sub_807A888
	ldr r1, _0804A2CC @ =0x03001830
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl SetMuMoveScript
_0804A248:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl sub_8027144
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, sb
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0804A2B0
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, sb
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, sb
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _0804A2CC @ =0x03001830
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
_0804A2B0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A2C0: .4byte 0x080DEF8F
_0804A2C4: .4byte 0x080DEF97
_0804A2C8: .4byte 0x03001810
_0804A2CC: .4byte 0x03001830

