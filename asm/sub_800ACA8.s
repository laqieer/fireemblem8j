	.syntax unified
	.set sub_800AB34, 0x0800AB34 + 1
	.set sub_800AC34, 0x0800AC34 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800ACA8, "ax", %progbits
@ sub_800ACA8 @ JP 0x0800ACA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800ACA8
	.thumb_func
sub_800ACA8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb4
	str r0, [sp, #0xac]
	str r2, [sp, #0x88]
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x8c]
	ldr r3, [sp, #0xac]
	ldr r3, [r3, #4]
	mov sb, r3
	ldr r7, [sp, #0xac]
	ldr r7, [r7, #8]
	str r7, [sp, #0x90]
	ldr r0, [sp, #0xac]
	ldr r0, [r0, #0xc]
	mov r8, r0
	add r0, sp, #0x80
	str r1, [r0]
	cmp r1, #0
	bne _0800ACDE
	movs r1, #0
	str r1, [sp, #0x94]
	b _0800ACE8
_0800ACDE:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	str r0, [sp, #0x94]
_0800ACE8:
	mov r7, sp
	adds r7, #0x10
	str r7, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	ldrh r0, [r1, #2]
	add r2, sp, #0x34
	add r1, sp, #0xc
_0800ACF6:
	str r2, [r1]
	subs r2, #0xc
	subs r1, #4
	cmp r1, sp
	bge _0800ACF6
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800AD0C
	movs r0, #1
	rsbs r0, r0, #0
	b _0800AEA0
_0800AD0C:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r1, [r2, r3]
	add r4, sp, #0x84
	mov r0, sb
	add r2, sp, #0x80
	adds r3, r4, #0
	bl sub_800AC34
	ldr r1, [r4]
	cmp r1, #0
	bne _0800AD2A
	movs r7, #1
	str r7, [sp, #0x98]
	b _0800AD3E
_0800AD2A:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	movs r7, #0
	str r7, [sp, #0x98]
	cmp r1, r0
	bne _0800AD3E
	movs r0, #2
	str r0, [sp, #0x98]
_0800AD3E:
	ldr r1, [sp, #0xac]
	ldr r0, [r1, #0x10]
	ldr r4, _0800AD9C @ =0x085B9894
	cmp r0, #0
	beq _0800AD4A
	adds r4, r0, #0
_0800AD4A:
	movs r6, #0
	ldr r2, [sp, #0xac]
	ldrh r2, [r2]
	add r3, sp, #0xa4
	strh r2, [r3]
	mov r7, sp
	adds r7, #0x40
	str r7, [sp, #0xa0]
	add r0, sp, #0x84
	mov sl, r0
	add r3, sp, #0x18
	add r2, sp, #0x14
	ldr r5, [sp, #0xa8]
	adds r5, #2
	ldr r1, [sp, #0xa8]
	mov ip, r1
	ldr r0, [sp, #0x94]
	ldr r1, [sp, #0x8c]
	adds r7, r0, #0
	muls r7, r1, r7
	lsls r0, r7, #2
	ldr r7, [sp, #0x90]
	adds r0, r7, r0
	str r0, [sp, #0x9c]
_0800AD7A:
	add r0, sp, #0xa4
	ldrh r1, [r0]
	mov r0, ip
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	subs r1, r0, #1
	cmp r1, #0
	bgt _0800ADA0
	mov r7, sb
	ldrh r0, [r7]
	strh r0, [r5]
	ldr r0, [sp, #0x90]
	str r0, [r2]
	b _0800ADF8
	.align 2, 0
_0800AD9C: .4byte 0x085B9894
_0800ADA0:
	ldr r7, [sp, #0x94]
	cmp r1, r7
	blt _0800ADBE
	lsls r1, r7, #1
	mov r0, sb
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r7, [sp, #0x9c]
	str r7, [r2]
	mov r0, r8
	cmp r0, #0
	beq _0800ADF8
	add r1, r8
	b _0800ADE8
_0800ADBE:
	lsls r0, r0, #1
	add r0, sb
	subs r0, #2
	ldrh r0, [r0]
	strh r0, [r5]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r6
	subs r0, r1, #1
	ldr r7, [sp, #0x8c]
	muls r0, r7, r0
	lsls r0, r0, #2
	ldr r7, [sp, #0x90]
	adds r0, r7, r0
	str r0, [r2]
	mov r0, r8
	cmp r0, #0
	beq _0800ADF8
	lsls r0, r1, #1
	add r0, r8
	subs r1, r0, #2
_0800ADE8:
	movs r7, #0
	ldrsh r1, [r1, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r3]
	b _0800ADFA
_0800ADF8:
	str r4, [r3]
_0800ADFA:
	adds r3, #0xc
	adds r2, #0xc
	adds r5, #0xc
	movs r0, #0xc
	add ip, r0
	adds r6, #1
	cmp r6, #3
	ble _0800AD7A
	ldr r0, [sp]
	ldr r1, [sp, #0xa0]
	ldr r2, [sp, #0x98]
	bl sub_800AB34
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r1, [r2, r3]
	ldr r2, [sp, #0x84]
	adds r0, r2, #1
	cmp r1, r0
	ble _0800AE3E
	lsls r1, r2, #1
	add r1, sb
	movs r7, #2
	ldrsh r0, [r1, r7]
	movs r3, #0
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	lsls r2, r2, #0xc
	ldr r1, [sp, #0x80]
	subs r1, r1, r2
	bl sub_80D6378
	adds r5, r0, #0
	b _0800AE4C
_0800AE3E:
	lsls r0, r2, #1
	add r0, sb
	movs r7, #0
	ldrsh r0, [r0, r7]
	lsls r0, r0, #0xc
	ldr r1, [sp, #0x80]
	subs r5, r1, r0
_0800AE4C:
	ldr r4, [sp, #0xa0]
	movs r6, #0
	ldr r0, [sp, #0x8c]
	cmp r6, r0
	bhs _0800AE9E
	movs r7, #0x80
	lsls r7, r7, #5
	ldr r1, [sp, #0x88]
	mov r8, r1
_0800AE5E:
	ldr r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl sub_80D6378
	ldr r1, [r4, #4]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl sub_80D6378
	ldr r1, [r4, #8]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl sub_80D6378
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
	adds r4, #0x10
	adds r6, #1
	ldr r3, [sp, #0x8c]
	cmp r6, r3
	blo _0800AE5E
_0800AE9E:
	ldr r0, [sp, #0x84]
_0800AEA0:
	add sp, #0xb4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

