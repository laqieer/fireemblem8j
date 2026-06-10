	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800A874, "ax", %progbits
@ sub_800A874 @ JP 0x0800A874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A874
	.thumb_func
sub_800A874:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r1, [sp]
	str r2, [sp, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	ldr r1, [r0, #0x14]
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r7, #4
	ldrsh r3, [r0, r7]
	movs r4, #6
	ldrsh r2, [r0, r4]
	ldr r7, [r0, #8]
	str r7, [sp, #0x18]
	ldr r4, [r0, #0xc]
	str r4, [sp, #0x1c]
	ldr r0, [r0, #0x10]
	mov sb, r0
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r6, #0x80
	lsls r6, r6, #5
	subs r4, r6, r0
	movs r7, #2
	ldrsh r0, [r1, r7]
	mov r8, r0
	movs r0, #4
	ldrsh r7, [r1, r0]
	cmp r2, r5
	beq _0800A8C0
	cmp r2, r3
	bne _0800A8C6
_0800A8C0:
	movs r1, #0
	str r1, [sp, #0x10]
	b _0800A8DC
_0800A8C6:
	subs r0, r2, r3
	subs r1, r5, r3
	lsls r1, r1, #0xc
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl sub_80D6378
	str r0, [sp, #0x10]
_0800A8DC:
	adds r5, r7, #0
	cmp r7, #0
	bge _0800A8E4
	rsbs r5, r7, #0
_0800A8E4:
	movs r6, #0x80
	lsls r6, r6, #5
	ldr r2, [sp, #0x10]
	adds r1, r5, #0
	muls r1, r2, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldr r2, [sp, #0x10]
	adds r1, r2, r5
	subs r1, r1, r0
	str r1, [sp, #0x10]
	subs r0, r6, r7
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r6, #0
	bl sub_80D6378
	mov r2, r8
	adds r1, r2, r6
	muls r1, r0, r1
	adds r0, r6, #0
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r6, #0
	bl sub_80D6378
	str r0, [sp, #8]
	adds r0, r7, r6
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r6, #0
	bl sub_80D6378
	mov r4, r8
	subs r1, r6, r4
	muls r1, r0, r1
	adds r0, r6, #0
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r6, #0
	bl sub_80D6378
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x14]
	cmp r7, #0
	ble _0800A9CA
	mov sl, sb
	ldr r0, [sp, #0x1c]
	mov sb, r0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x14]
	mov r8, r1
_0800A956:
	ldr r1, [r7]
	mov r2, sb
	ldr r0, [r2]
	subs r6, r1, r0
	mov r0, sl
	ldr r4, [r0]
	subs r4, r4, r1
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r5, r5, r0
	ldr r2, [sp, #0x10]
	adds r1, r2, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r4, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	cmp r0, #2
	bne _0800A9B0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r0, r1, r2
	adds r1, r0, #0
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	str r0, [r4]
_0800A9B0:
	ldr r4, [sp]
	adds r4, #4
	str r4, [sp]
	movs r0, #4
	add sl, r0
	add sb, r0
	adds r7, #4
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bne _0800A956
_0800A9CA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

