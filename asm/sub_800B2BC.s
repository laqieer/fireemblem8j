	.syntax unified
	.set sub_800AB34, 0x0800AB34 + 1
	.set sub_800AC34, 0x0800AC34 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800B2BC, "ax", %progbits
@ sub_800B2BC @ JP 0x0800B2BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800B2BC
	.thumb_func
sub_800B2BC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb0
	adds r7, r0, #0
	str r2, [sp, #0x88]
	movs r2, #0
	ldrsh r0, [r7, r2]
	str r0, [sp, #0x8c]
	ldr r3, [r7, #4]
	mov sb, r3
	ldr r4, [r7, #8]
	str r4, [sp, #0x90]
	ldr r0, [r7, #0xc]
	mov r8, r0
	ldr r2, [r7, #0x10]
	mov sl, r2
	add r0, sp, #0x80
	str r1, [r0]
	cmp r1, #0
	bne _0800B2F0
	movs r3, #0
	str r3, [sp, #0x94]
	b _0800B2F8
_0800B2F0:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	str r0, [sp, #0x94]
_0800B2F8:
	mov r0, sp
	adds r0, #0x10
	str r0, [sp, #0xa4]
	ldrh r0, [r7, #2]
	add r2, sp, #0x34
	add r1, sp, #0xc
_0800B304:
	str r2, [r1]
	subs r2, #0xc
	subs r1, #4
	cmp r1, sp
	bge _0800B304
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800B31A
	movs r0, #1
	rsbs r0, r0, #0
	b _0800B4B2
_0800B31A:
	movs r2, #2
	ldrsh r1, [r7, r2]
	add r4, sp, #0x84
	mov r0, sb
	add r2, sp, #0x80
	adds r3, r4, #0
	bl sub_800AC34
	ldr r1, [r4]
	cmp r1, #0
	bne _0800B334
	movs r3, #1
	b _0800B344
_0800B334:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	movs r2, #0
	str r2, [sp, #0x98]
	cmp r1, r0
	bne _0800B346
	movs r3, #2
_0800B344:
	str r3, [sp, #0x98]
_0800B346:
	movs r6, #0
	ldrh r4, [r7]
	add r0, sp, #0xa8
	strh r4, [r0]
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0xa0]
	add r2, sp, #0x18
	mov ip, r6
	add r5, sp, #0x14
	mov r3, sp
	adds r3, #0x84
	str r3, [sp, #0xac]
	ldr r4, [sp, #0x94]
	lsls r0, r4, #2
	ldr r1, [sp, #0x90]
	adds r0, r0, r1
	str r0, [sp, #0x9c]
_0800B36A:
	ldr r3, [sp, #0xa4]
	add r3, ip
	add r4, sp, #0xa8
	ldrh r4, [r4]
	strh r4, [r3]
	ldr r1, [sp, #0xac]
	ldr r0, [r1]
	adds r0, r0, r6
	subs r1, r0, #1
	cmp r1, #0
	bgt _0800B3A0
	mov r4, sb
	ldrh r0, [r4]
	strh r0, [r3, #2]
	ldr r1, [sp, #0x90]
	ldr r0, [r1]
	str r0, [r5]
	mov r3, sl
	ldr r0, [r3]
	cmp r0, #0
	bne _0800B404
	ldr r4, _0800B39C @ =0x085B9894
	str r4, [r2]
	b _0800B40C
	.align 2, 0
_0800B39C: .4byte 0x085B9894
_0800B3A0:
	ldr r4, [sp, #0x94]
	cmp r1, r4
	blt _0800B3CE
	lsls r1, r4, #1
	mov r4, sb
	adds r0, r1, r4
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r3, [sp, #0x9c]
	ldr r0, [r3]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B408
	adds r0, r1, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	bne _0800B404
	b _0800B408
_0800B3CE:
	lsls r0, r0, #1
	add r0, sb
	subs r0, #2
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r4, [sp, #0xac]
	ldr r0, [r4]
	adds r1, r0, r6
	lsls r0, r1, #2
	ldr r3, [sp, #0x90]
	adds r0, r0, r3
	subs r0, #4
	ldr r0, [r0]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B408
	lsls r0, r1, #1
	add r0, r8
	subs r0, #2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	beq _0800B408
_0800B404:
	str r0, [r2]
	b _0800B40C
_0800B408:
	ldr r3, _0800B44C @ =0x085B9894
	str r3, [r2]
_0800B40C:
	adds r2, #0xc
	movs r4, #0xc
	add ip, r4
	adds r5, #0xc
	adds r6, #1
	cmp r6, #3
	ble _0800B36A
	ldr r0, [sp]
	ldr r1, [sp, #0xa0]
	ldr r2, [sp, #0x98]
	bl sub_800AB34
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x84]
	adds r0, r2, #1
	cmp r1, r0
	ble _0800B450
	lsls r1, r2, #1
	add r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	lsls r2, r2, #0xc
	ldr r1, [sp, #0x80]
	subs r1, r1, r2
	bl sub_80D6378
	adds r5, r0, #0
	b _0800B45E
	.align 2, 0
_0800B44C: .4byte 0x085B9894
_0800B450:
	lsls r0, r2, #1
	add r0, sb
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #0xc
	ldr r1, [sp, #0x80]
	subs r5, r1, r0
_0800B45E:
	ldr r4, [sp, #0xa0]
	movs r6, #0
	ldr r0, [sp, #0x8c]
	cmp r6, r0
	bhs _0800B4B0
	movs r7, #0x80
	lsls r7, r7, #5
	ldr r1, [sp, #0x88]
	mov r8, r1
_0800B470:
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
	blo _0800B470
_0800B4B0:
	ldr r0, [sp, #0x84]
_0800B4B2:
	add sp, #0xb0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

