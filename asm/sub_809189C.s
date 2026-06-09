	.syntax unified
	.set GetCgTextFlags, 0x08090D10 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809189C, "ax", %progbits
@ sub_809189C @ JP 0x0809189C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809189C
	.thumb_func
sub_809189C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #0
	mov sb, r0
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #4]
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _0809190C
	cmp r1, r0
	bhi _080918F0
	cmp r1, #0
	beq _080918FE
	b _08091936
_080918F0:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _0809191C
	cmp r1, r2
	beq _0809192C
	b _08091936
_080918FE:
	ldr r0, _08091908 @ =0x03003020
	ldrh r1, [r0, #0x1c]
	subs r6, r6, r1
	ldrh r0, [r0, #0x1e]
	b _08091934
	.align 2, 0
_08091908: .4byte 0x03003020
_0809190C:
	ldr r0, _08091918 @ =0x03003020
	ldrh r1, [r0, #0x20]
	subs r6, r6, r1
	ldrh r0, [r0, #0x22]
	b _08091934
	.align 2, 0
_08091918: .4byte 0x03003020
_0809191C:
	ldr r0, _08091928 @ =0x03003020
	ldrh r1, [r0, #0x24]
	subs r6, r6, r1
	ldrh r0, [r0, #0x26]
	b _08091934
	.align 2, 0
_08091928: .4byte 0x03003020
_0809192C:
	ldr r0, _080919A4 @ =0x03003020
	ldrh r1, [r0, #0x28]
	subs r6, r6, r1
	ldrh r0, [r0, #0x2a]
_08091934:
	subs r7, r7, r0
_08091936:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0809197A
	adds r1, r6, #0
	subs r1, #0x10
	ldr r5, _080919A8 @ =0x000001FF
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	movs r4, #0xff
	ands r2, r4
	ldr r3, _080919AC @ =0x08A73E40
	ldr r0, _080919B0 @ =0x000013C8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r1, r6, #0
	subs r1, #8
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x14
	ands r2, r4
	ldr r3, _080919B4 @ =0x08A73E66
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_0809197A:
	movs r4, #0
	mov r0, r8
	adds r0, #0x5c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	str r0, [sp, #0xc]
	movs r2, #0x50
	add r2, r8
	mov sl, r2
	movs r3, #0x5b
	add r8, r3
	cmp r4, r1
	bge _08091A0E
_0809199A:
	movs r5, #0
	mov sb, r5
	adds r0, r4, #1
	str r0, [sp, #0x10]
	b _080919EA
	.align 2, 0
_080919A4: .4byte 0x03003020
_080919A8: .4byte 0x000001FF
_080919AC: .4byte 0x08A73E40
_080919B0: .4byte 0x000013C8
_080919B4: .4byte 0x08A73E66
_080919B8:
	mov r2, sb
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _08091A3C @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, sb
	lsls r0, r3, #2
	mov r5, sl
	ldrh r5, [r5]
	adds r0, r0, r5
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08091A40 @ =0x085B8D24
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_080919EA:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080919F6
	adds r0, #3
_080919F6:
	asrs r0, r0, #2
	cmp sb, r0
	blt _080919B8
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _0809199A
_08091A0E:
	mov r3, r8
	ldrb r0, [r3]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08091AAE
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08091A26
	adds r0, r1, #3
_08091A26:
	asrs r0, r0, #2
	lsls r4, r0, #2
	str r4, [sp, #8]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r4, #0
	ldr r5, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _08091AA4
	.align 2, 0
_08091A3C: .4byte 0x000001FF
_08091A40: .4byte 0x085B8D24
_08091A44:
	movs r0, #0
	mov sb, r0
	adds r1, r4, #1
	str r1, [sp, #0x10]
	b _08091A80
_08091A4E:
	mov r2, sb
	lsls r1, r2, #3
	adds r1, r6, r1
	ldr r0, _08091AEC @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, sl
	ldrh r0, [r3]
	ldr r5, [sp, #8]
	adds r0, r0, r5
	add r0, sb
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _08091AF0 @ =0x085B8CFC
	bl PutSpriteExt
	movs r5, #1
	add sb, r5
_08091A80:
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _08091A8E
	adds r0, r1, #3
_08091A8E:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	blt _08091A4E
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
_08091AA4:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _08091A44
_08091AAE:
	mov r2, sb
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _08091AEC @ =0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _08091AF4 @ =0x085B8D24
	mov r5, sb
	lsls r0, r5, #2
	mov r6, sl
	ldrh r6, [r6]
	adds r0, r0, r6
	lsls r4, r4, #6
	adds r0, r0, r4
	ldr r4, [sp, #4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091AEC: .4byte 0x000001FF
_08091AF0: .4byte 0x085B8CFC
_08091AF4: .4byte 0x085B8D24

