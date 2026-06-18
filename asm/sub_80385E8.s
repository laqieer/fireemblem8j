	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80385E8, "ax", %progbits
@ DrawNumberText @ JP 0x080385E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawNumberText
	.thumb_func
DrawNumberText:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sb, r4
	movs r4, #0
	cmp r4, r7
	bge _0803863A
_0803861A:
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_80D637C
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_80D6374
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, r7
	blt _0803861A
_0803863A:
	movs r0, #0
	mov r8, r0
	subs r4, r7, #1
	cmp r4, #0
	blt _08038694
_08038644:
	mov r2, sp
	adds r5, r2, r4
	ldrb r0, [r5]
	cmp r0, #0
	beq _08038652
	movs r0, #1
	mov r8, r0
_08038652:
	mov r2, r8
	cmp r2, #0
	bne _0803865C
	cmp r4, #0
	bne _0803868C
_0803865C:
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	mov r2, sb
	bl sub_8003D98
	ldrb r1, [r5]
	adds r0, r6, #0
	bl sub_8003F98
	mov r0, sl
	lsls r1, r0, #5
	ldr r2, [sp, #8]
	subs r0, r2, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080386A8 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_0803868C:
	adds r6, #8
	subs r4, #1
	cmp r4, #0
	bge _08038644
_08038694:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080386A8: .4byte 0x02022CA8

