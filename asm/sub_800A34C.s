	.syntax unified
	.set __udivsi3, 0x080D67D0 + 1
	.set sub_800A194, 0x0800A194 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800A34C, "ax", %progbits
@ sub_800A34C @ JP 0x0800A34C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A34C
	.thumb_func
sub_800A34C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	mov sl, r0
	str r1, [sp, #0x54]
	str r2, [sp, #0x58]
	str r3, [sp, #0x5c]
	lsrs r3, r3, #0xc
	movs r0, #0
	str r0, [sp, #0x60]
	ldr r1, [sp, #0x98]
	subs r1, #1
	mov r2, sp
	adds r2, #0x34
	str r2, [sp, #0x6c]
	add r7, sp, #0x14
	add r4, sp, #0x24
	mov sb, r4
	mov r5, sp
	adds r5, #0x38
	str r5, [sp, #0x70]
	cmp r0, r1
	bge _0800A3AE
	adds r6, r1, #0
	ldr r0, [sp, #0x58]
	ldrh r0, [r0]
	cmp r3, r0
	blo _0800A392
	ldr r1, [sp, #0x58]
	ldrh r1, [r1, #2]
	cmp r3, r1
	blo _0800A3AE
_0800A392:
	ldr r2, [sp, #0x60]
	adds r2, #1
	str r2, [sp, #0x60]
	cmp r2, r6
	bge _0800A3AE
	lsls r0, r2, #1
	ldr r4, [sp, #0x58]
	adds r0, r0, r4
	ldrh r5, [r0]
	cmp r3, r5
	blo _0800A392
	ldrh r0, [r0, #2]
	cmp r3, r0
	bhs _0800A392
_0800A3AE:
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, [r0, #8]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	str r0, [sp, #0x34]
	mov r3, sl
	ldr r1, [r3, #4]
	ldr r0, [r3, #0xc]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	ldr r4, [sp, #0x6c]
	str r0, [r4, #4]
	movs r4, #1
	ldr r5, [sp, #0x98]
	subs r5, #1
	mov r8, r5
	mov r6, r8
	ldr r0, [sp, #0x98]
	lsls r0, r0, #3
	str r0, [sp, #0x68]
	cmp r4, r6
	bge _0800A440
	mov ip, r2
	ldr r5, [sp, #0x6c]
	adds r5, #8
	mov r1, sp
	adds r1, #8
	str r1, [sp, #0x74]
_0800A3FC:
	lsls r1, r4, #2
	ldr r0, [sp, #0x74]
	mov r2, ip
	stm r0!, {r2}
	str r0, [sp, #0x74]
	adds r2, r7, r1
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r2]
	add r1, sb
	mov r2, ip
	str r2, [r1]
	lsls r2, r4, #3
	ldr r1, [r3]
	ldr r0, [r3, #0x10]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	str r0, [r5]
	ldr r0, [sp, #0x70]
	adds r2, r0, r2
	ldr r1, [r3, #4]
	ldr r0, [r3, #0x14]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	str r0, [r2]
	adds r3, #8
	adds r5, #8
	adds r4, #1
	cmp r4, r8
	blt _0800A3FC
_0800A440:
	lsls r1, r6, #2
	mov r0, sp
	adds r0, r0, r1
	adds r0, #4
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	adds r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	lsls r2, r6, #3
	ldr r4, [sp, #0x6c]
	adds r3, r4, r2
	ldr r0, [sp, #0x68]
	add r0, sl
	adds r5, r0, #0
	subs r5, #0x10
	adds r4, r0, #0
	subs r4, #8
	ldr r1, [r5]
	ldr r0, [r4]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	str r0, [r3]
	ldr r0, [sp, #0x70]
	adds r2, r0, r2
	ldr r1, [r5, #4]
	ldr r0, [r4, #4]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	rsbs r0, r0, #0
	str r0, [r2]
	ldr r1, [sp, #0x98]
	str r1, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	ldr r3, [sp, #0x6c]
	bl sub_800A194
	ldr r2, [sp, #0x60]
	cmp r2, r6
	bge _0800A578
	lsls r1, r2, #1
	ldr r3, [sp, #0x58]
	adds r1, r1, r3
	ldrh r2, [r1]
	lsls r0, r2, #0xc
	ldr r4, [sp, #0x5c]
	subs r0, r4, r0
	ldrh r1, [r1, #2]
	subs r1, r1, r2
	bl __udivsi3
	mov sb, r0
	ldr r5, [sp, #0x60]
	lsls r5, r5, #3
	mov r8, r5
	add r5, sl
	ldr r7, [r5]
	ldr r1, [r5, #8]
	subs r2, r7, r1
	lsls r2, r2, #1
	ldr r0, [sp, #0x6c]
	add r0, r8
	ldr r0, [r0]
	mov sl, r0
	add r2, sl
	ldr r3, [sp, #0x60]
	adds r3, #1
	lsls r3, r3, #3
	ldr r4, [sp, #0x6c]
	adds r0, r4, r3
	ldr r6, [r0]
	adds r2, r2, r6
	subs r1, r1, r7
	lsls r4, r1, #1
	adds r4, r4, r1
	mov r1, sl
	lsls r0, r1, #1
	subs r4, r4, r0
	subs r4, r4, r6
	ldr r0, [r5, #4]
	str r0, [sp, #0x64]
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0x64]
	subs r6, r1, r0
	lsls r6, r6, #1
	ldr r5, [sp, #0x70]
	add r8, r5
	mov r1, r8
	ldr r1, [r1]
	mov r8, r1
	add r6, r8
	adds r3, r5, r3
	ldr r1, [r3]
	adds r6, r6, r1
	ldr r3, [sp, #0x64]
	subs r0, r0, r3
	lsls r5, r0, #1
	adds r5, r5, r0
	mov r3, r8
	lsls r0, r3, #1
	subs r5, r5, r0
	subs r5, r5, r1
	mov r1, sb
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r0, r0, r4
	mov r1, sb
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	add r0, sl
	mov r1, sb
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r0, r0, r7
	ldr r4, [sp, #0x54]
	str r0, [r4]
	mov r1, sb
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	adds r0, r0, r5
	mov r1, sb
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	add r0, r8
	mov r1, sb
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl sub_80D6378
	ldr r5, [sp, #0x64]
	adds r0, r0, r5
	str r0, [r4, #4]
	b _0800A582
_0800A578:
	ldr r0, [r4]
	ldr r1, [sp, #0x54]
	str r0, [r1]
	ldr r0, [r4, #4]
	str r0, [r1, #4]
_0800A582:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

