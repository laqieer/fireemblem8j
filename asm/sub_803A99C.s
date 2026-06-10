	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803A99C, "ax", %progbits
@ sub_803A99C @ JP 0x0803A99C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A99C
	.thumb_func
sub_803A99C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	str r1, [sp]
	movs r0, #0xff
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0803A9E0 @ =0x03004DF0
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	ldr r0, _0803A9E4 @ =0x0202E4D0
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803AA58
	.align 2, 0
_0803A9E0: .4byte 0x03004DF0
_0803A9E4: .4byte 0x0202E4D0
_0803A9E8:
	ldr r0, _0803AA68 @ =0x0202E4D0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r1, r6, #1
	mov r8, r1
	cmp r4, #0
	blt _0803AA54
	ldr r7, _0803AA6C @ =0x0202E4E0
	lsls r5, r6, #2
_0803A9FE:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AA4A
	ldr r0, _0803AA70 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AA4A
	ldr r0, _0803AA74 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AA4A
	adds r0, r1, #0
	bl GetUnit
	bl sub_80D65E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AA4A
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, sl
	bhi _0803AA4A
	adds r1, r0, #0
	mov sl, r1
	str r4, [sp, #4]
	str r6, [sp, #8]
_0803AA4A:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bge _0803A9FE
_0803AA54:
	mov r1, r8
	lsls r0, r1, #0x10
_0803AA58:
	asrs r6, r0, #0x10
	cmp r6, #0
	bge _0803A9E8
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _0803AA78
	movs r0, #0
	b _0803AA8A
	.align 2, 0
_0803AA68: .4byte 0x0202E4D0
_0803AA6C: .4byte 0x0202E4E0
_0803AA70: .4byte 0x0202E4D4
_0803AA74: .4byte 0x0202BE40
_0803AA78:
	mov r1, sp
	ldrh r0, [r1, #4]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1, #2]
	movs r0, #1
_0803AA8A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

