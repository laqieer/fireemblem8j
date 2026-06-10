	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800A9DC, "ax", %progbits
@ sub_800A9DC @ JP 0x0800A9DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A9DC
	.thumb_func
sub_800A9DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r1
	str r2, [sp]
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x10]
	ldr r1, [r0, #0x14]
	movs r3, #2
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r6, #6
	ldrsh r2, [r0, r6]
	ldr r5, [r0, #8]
	str r5, [sp, #0x14]
	ldr r6, [r0, #0xc]
	str r6, [sp, #0x18]
	ldr r0, [r0, #0x10]
	mov sb, r0
	movs r5, #0
	ldrsh r0, [r1, r5]
	movs r5, #0x80
	lsls r5, r5, #5
	subs r7, r5, r0
	movs r0, #2
	ldrsh r6, [r1, r0]
	mov r8, r6
	movs r0, #4
	ldrsh r6, [r1, r0]
	cmp r2, r4
	beq _0800AA28
	cmp r2, r3
	bne _0800AA2E
_0800AA28:
	movs r1, #0
	str r1, [sp, #0xc]
	b _0800AA44
_0800AA2E:
	subs r0, r2, r3
	subs r1, r2, r4
	lsls r1, r1, #0xc
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xd
	adds r0, r5, #0
	bl sub_80D6378
	str r0, [sp, #0xc]
_0800AA44:
	adds r4, r6, #0
	cmp r6, #0
	bge _0800AA4C
	rsbs r4, r6, #0
_0800AA4C:
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r2, [sp, #0xc]
	adds r1, r4, #0
	muls r1, r2, r1
	adds r0, r5, #0
	bl sub_80D6378
	ldr r3, [sp, #0xc]
	adds r1, r3, r4
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r0, r6, r5
	adds r1, r7, #0
	muls r1, r0, r1
	adds r0, r5, #0
	bl sub_80D6378
	mov r2, r8
	adds r1, r2, r5
	muls r1, r0, r1
	adds r0, r5, #0
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r5, #0
	bl sub_80D6378
	str r0, [sp, #4]
	subs r0, r5, r6
	adds r1, r7, #0
	muls r1, r0, r1
	adds r0, r5, #0
	bl sub_80D6378
	mov r3, r8
	subs r1, r5, r3
	muls r1, r0, r1
	adds r0, r5, #0
	bl sub_80D6378
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r5, #0
	bl sub_80D6378
	str r0, [sp, #8]
	ldr r6, [sp, #0x10]
	cmp r6, #0
	ble _0800AB24
	ldr r0, [sp, #0x18]
	mov r8, r0
	ldr r6, [sp, #0x14]
	ldr r7, [sp, #0x10]
_0800AABA:
	ldr r2, [r6]
	mov r3, r8
	ldr r1, [r3]
	subs r1, r2, r1
	mov r5, sb
	ldr r0, [r5]
	subs r5, r0, r2
	ldr r0, [sp, #4]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r4, r0, #0
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r4, r4, r0
	ldr r3, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov r1, sl
	str r0, [r1]
	ldr r2, [sp]
	cmp r2, #1
	bne _0800AB14
	ldr r3, [sp, #4]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	mov r2, sl
	str r0, [r2]
_0800AB14:
	movs r3, #4
	add sl, r3
	add sb, r3
	add r8, r3
	adds r6, #4
	subs r7, #1
	cmp r7, #0
	bne _0800AABA
_0800AB24:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

