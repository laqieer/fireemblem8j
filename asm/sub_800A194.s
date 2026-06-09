	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800A194, "ax", %progbits
@ sub_800A194 @ JP 0x0800A194 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A194
	.thumb_func
sub_800A194:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	mov r8, r3
	ldr r0, [sp, #0x30]
	mov sb, r0
	ldr r0, [r7]
	ldr r1, [r1]
	lsls r1, r1, #0xc
	bl sub_80D6378
	ldr r1, [sp]
	str r0, [r1]
	movs r6, #1
	mov r0, sb
	subs r0, #1
	cmp r6, r0
	bge _0800A202
	adds r5, r7, #4
	ldr r2, [sp, #4]
	adds r2, #4
	mov sl, r2
	ldr r4, [sp]
_0800A1CE:
	ldr r1, [r4]
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldm r3!, {r0}
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r1, r0, #0
	ldr r0, [r5]
	subs r0, r0, r1
	stm r5!, {r0}
	ldr r1, [r4, #4]
	lsls r1, r1, #0xc
	bl sub_80D6378
	str r0, [r4, #4]
	adds r4, #4
	adds r6, #1
	mov r0, sb
	subs r0, #1
	cmp r6, r0
	blt _0800A1CE
_0800A202:
	movs r0, #0x80
	lsls r0, r0, #5
	mov r1, sb
	lsls r4, r1, #2
	ldr r3, [sp]
	adds r2, r4, r3
	subs r2, #8
	ldr r3, [sp, #4]
	adds r1, r4, r3
	subs r1, #4
	ldr r2, [r2]
	ldr r1, [r1]
	muls r1, r2, r1
	bl sub_80D6378
	adds r4, r4, r7
	subs r4, #4
	ldr r1, [r4]
	subs r1, r1, r0
	str r1, [r4]
	ldr r0, [r7]
	mov r2, r8
	ldr r1, [r2]
	lsls r1, r1, #0xc
	bl sub_80D6378
	mov r3, r8
	str r0, [r3]
	mov r0, sb
	subs r0, #2
	str r0, [sp, #8]
	mov r1, sb
	cmp r1, #1
	ble _0800A288
	mov r5, r8
	ldr r2, [sp, #4]
	adds r2, #4
	str r2, [sp, #0xc]
	adds r3, r7, #4
	mov sl, r3
	mov r6, sb
	subs r6, #1
_0800A256:
	mov r0, sl
	adds r0, #4
	mov sl, r0
	subs r0, #4
	ldm r0!, {r4}
	ldr r2, [sp, #0xc]
	ldm r2!, {r1}
	str r2, [sp, #0xc]
	ldr r0, [r5]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r1, [r5, #8]
	subs r1, r1, r0
	lsls r1, r1, #0xc
	adds r0, r4, #0
	bl sub_80D6378
	str r0, [r5, #8]
	adds r5, #8
	subs r6, #1
	cmp r6, #0
	bne _0800A256
_0800A288:
	ldr r0, [r7]
	mov r3, r8
	ldr r1, [r3, #4]
	lsls r1, r1, #0xc
	bl sub_80D6378
	mov r1, r8
	str r0, [r1, #4]
	mov r2, sb
	cmp r2, #1
	ble _0800A2DA
	mov r5, r8
	ldr r3, [sp, #4]
	adds r3, #4
	mov sl, r3
	adds r7, #4
	mov r6, sb
	subs r6, #1
_0800A2AC:
	ldm r7!, {r4}
	mov r0, sl
	adds r0, #4
	mov sl, r0
	subs r0, #4
	ldm r0!, {r1}
	ldr r0, [r5, #4]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0xc
	adds r0, r4, #0
	bl sub_80D6378
	str r0, [r5, #0xc]
	adds r5, #8
	subs r6, #1
	cmp r6, #0
	bne _0800A2AC
_0800A2DA:
	ldr r6, [sp, #8]
	cmp r6, #0
	blt _0800A30A
	lsls r0, r6, #3
	mov r1, r8
	adds r4, r0, r1
	lsls r0, r6, #2
	ldr r2, [sp]
	adds r5, r0, r2
_0800A2EC:
	ldr r1, [r4, #8]
	ldr r0, [r5]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r1, [r4]
	subs r1, r1, r0
	str r1, [r4]
	subs r4, #8
	subs r5, #4
	subs r6, #1
	cmp r6, #0
	bge _0800A2EC
_0800A30A:
	ldr r6, [sp, #8]
	cmp r6, #0
	blt _0800A33C
	lsls r0, r6, #3
	adds r0, #4
	mov r3, r8
	adds r4, r0, r3
	lsls r0, r6, #2
	ldr r1, [sp]
	adds r5, r0, r1
_0800A31E:
	ldr r1, [r4, #8]
	ldr r0, [r5]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r1, [r4]
	subs r1, r1, r0
	str r1, [r4]
	subs r4, #8
	subs r5, #4
	subs r6, #1
	cmp r6, #0
	bge _0800A31E
_0800A33C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

