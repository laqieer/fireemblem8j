	.syntax unified
	.set __mcmp, 0x080D9E88 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.section .text.sub_80D7C98, "ax", %progbits
@ quorem @ JP 0x080D7C98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global quorem
	.thumb_func
quorem:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r7, [r1, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r7
	bge _080D7CB4
	movs r0, #0
	b _080D7DE8
_080D7CB4:
	ldr r0, [sp, #4]
	adds r0, #0x14
	mov r8, r0
	subs r7, #1
	lsls r0, r7, #2
	mov r1, r8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r4, [sp]
	adds r4, #0x14
	adds r5, r4, r0
	ldr r1, [r1]
	adds r1, #1
	ldr r2, [r5]
	mov sl, r2
	mov r0, sl
	bl __udivsi3
	str r0, [sp, #8]
	mov r3, r8
	str r3, [sp, #0x14]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _080D7D5E
	movs r6, #0
	mov sb, r6
	ldr r0, _080D7D48 @ =0x0000FFFF
	mov ip, r0
_080D7CEC:
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	ldm r2!, {r1}
	adds r0, r1, #0
	mov r3, ip
	ands r0, r3
	ldr r2, [sp, #8]
	muls r0, r2, r0
	mov r3, sb
	adds r2, r0, r3
	lsrs r0, r1, #0x10
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r0, [r4]
	mov r1, ip
	ands r0, r1
	ands r2, r1
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	ldr r0, [r4]
	lsrs r1, r0, #0x10
	mov r0, ip
	ands r3, r0
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D7CEC
	mov r2, sl
	cmp r2, #0
	bne _080D7D5E
	ldr r4, [sp, #0x10]
	b _080D7D4E
	.align 2, 0
_080D7D48: .4byte 0x0000FFFF
_080D7D4C:
	subs r7, #1
_080D7D4E:
	subs r5, #4
	cmp r5, r4
	bls _080D7D5A
	ldr r0, [r5]
	cmp r0, #0
	beq _080D7D4C
_080D7D5A:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D7D5E:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __mcmp
	cmp r0, #0
	blt _080D7DE6
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	movs r6, #0
	mov sb, r6
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r8, r1
	lsls r2, r7, #2
	mov sl, r2
	ldr r5, _080D7DD0 @ =0x0000FFFF
_080D7D80:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r1}
	adds r0, r1, #0
	ands r0, r5
	mov r3, sb
	adds r2, r0, r3
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	ands r2, r5
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	lsrs r1, r1, #0x10
	ands r3, r5
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D7D80
	ldr r4, [sp, #0x10]
	mov r2, sl
	adds r5, r4, r2
	ldr r0, [r5]
	cmp r0, #0
	bne _080D7DE6
	b _080D7DD6
	.align 2, 0
_080D7DD0: .4byte 0x0000FFFF
_080D7DD4:
	subs r7, #1
_080D7DD6:
	subs r5, #4
	cmp r5, r4
	bls _080D7DE2
	ldr r0, [r5]
	cmp r0, #0
	beq _080D7DD4
_080D7DE2:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D7DE6:
	ldr r0, [sp, #8]
_080D7DE8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

