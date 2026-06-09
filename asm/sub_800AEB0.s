	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800AEB0, "ax", %progbits
@ sub_800AEB0 @ JP 0x0800AEB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800AEB0
	.thumb_func
sub_800AEB0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r1, #0
	ldr r1, [r0]
	str r1, [sp]
	ldr r2, [r0, #4]
	str r2, [sp, #4]
	ldr r3, [r0, #8]
	str r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mov sb, r0
	adds r0, r1, #0
	adds r1, r0, #0
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r4, r0, #0
	ldr r2, [sp, #4]
	adds r1, r2, #0
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov sl, r0
	ldr r3, [sp, #8]
	adds r1, r3, #0
	muls r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov r8, r0
	mov r0, sb
	mov r1, sb
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	add r4, sl
	add r4, r8
	adds r4, r4, r0
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r4, #0
	bl sub_80D6378
	adds r4, r0, #0
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov r8, r0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r5, r0, #0
	ldr r0, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r7, r0, #0
	mov r2, r8
	mov r1, sb
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	str r0, [sp, #0xc]
	mov r1, sb
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	str r0, [sp, #0x10]
	mov r1, sb
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	str r0, [sp, #0x14]
	ldr r3, [sp]
	mov r1, r8
	muls r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov sl, r0
	ldr r0, [sp]
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov r8, r0
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov sb, r0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	adds r1, r0, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r4, r0, #0
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r3, [sp, #0x18]
	adds r1, r3, r0
	movs r2, #0x80
	lsls r2, r2, #5
	subs r1, r2, r1
	str r1, [r6]
	ldr r1, [sp, #0x14]
	add r1, r8
	str r1, [r6, #4]
	mov r3, sb
	ldr r2, [sp, #0x10]
	subs r1, r3, r2
	str r1, [r6, #8]
	mov r3, r8
	ldr r1, [sp, #0x14]
	subs r3, r3, r1
	str r3, [r6, #0x10]
	add r0, sl
	movs r2, #0x80
	lsls r2, r2, #5
	subs r0, r2, r0
	str r0, [r6, #0x14]
	ldr r3, [sp, #0xc]
	adds r0, r4, r3
	str r0, [r6, #0x18]
	ldr r0, [sp, #0x10]
	add sb, r0
	mov r1, sb
	str r1, [r6, #0x20]
	subs r4, r4, r3
	str r4, [r6, #0x24]
	ldr r2, [sp, #0x18]
	add sl, r2
	mov r0, sl
	movs r3, #0x80
	lsls r3, r3, #5
	subs r0, r3, r0
	str r0, [r6, #0x28]
	movs r0, #0
	str r0, [r6, #0x38]
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	str r0, [r6, #0x2c]
	str r0, [r6, #0x1c]
	str r0, [r6, #0xc]
	str r3, [r6, #0x3c]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

