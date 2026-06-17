	.syntax unified
	.set sub_800AC34, 0x0800AC34 + 1
	.set Spline_Eval, 0x0800ACA8 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_800B4F0, "ax", %progbits
@ sub_800B4F0 @ JP 0x0800B4F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800B4F0
	.thumb_func
sub_800B4F0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [r5, #4]
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov sb, r1
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl sub_800AC34
	ldr r0, [r6, #4]
	mov r1, sl
	strh r1, [r0, #2]
	mov r0, sb
	subs r0, #1
	ldr r4, [sp, #0x18]
	cmp r4, r0
	bge _0800B5F0
	lsls r4, r4, #1
	add r4, r8
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl sub_80D6378
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0800B5F0
	ldr r4, [r6, #8]
	ldr r3, [sp, #0x18]
	lsls r2, r3, #1
	adds r1, r2, r3
	lsls r1, r1, #2
	ldr r0, [r5, #8]
	adds r0, r0, r1
	adds r0, #0xc
	str r0, [r4, #4]
	ldr r4, [r6, #0x10]
	ldr r0, [r5, #0xc]
	adds r2, r2, r0
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r4, #4]
	mov r0, sb
	subs r0, #2
	cmp r3, r0
	bge _0800B5B0
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl sub_80D6378
	ldr r4, [r6, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [r5, #4]
	lsls r3, r2, #1
	adds r1, r3, r1
	ldrh r1, [r1, #4]
	add r1, sl
	subs r1, r1, r0
	strh r1, [r4, #4]
	ldr r1, [r6, #8]
	adds r2, r3, r2
	lsls r2, r2, #2
	ldr r0, [r5, #8]
	adds r0, r0, r2
	adds r0, #0x18
	str r0, [r1, #8]
	ldr r2, [r6, #0x10]
	ldr r0, [r5, #0xc]
	adds r3, r3, r0
	movs r1, #4
	ldrsh r0, [r3, r1]
	b _0800B5E2
_0800B5B0:
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl sub_80D6378
	ldr r4, [r6, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [r5, #4]
	lsls r3, r2, #1
	adds r1, r3, r1
	ldrh r1, [r1, #2]
	add r1, sl
	subs r1, r1, r0
	strh r1, [r4, #4]
	ldr r1, [r6, #8]
	adds r2, r3, r2
	lsls r2, r2, #2
	ldr r0, [r5, #8]
	adds r0, r0, r2
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r6, #0x10]
	ldr r0, [r5, #0xc]
	adds r3, r3, r0
	movs r1, #2
	ldrsh r0, [r3, r1]
_0800B5E2:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _0800B6AC
_0800B5F0:
	mov r1, sp
	ldrh r0, [r5]
	movs r4, #0
	strh r0, [r1, #2]
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r5, #4]
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r0, sp
	adds r2, r7, #0
	bl Spline_Eval
	cmp r0, #0
	bge _0800B620
	str r4, [r7, #8]
	str r4, [r7, #4]
	str r4, [r7]
_0800B620:
	ldr r4, [r6, #8]
	str r7, [r4, #4]
	ldr r2, [r6, #0x10]
	mov r8, r2
	ldr r2, [sp, #0x18]
	ldr r1, [r5, #0xc]
	lsls r0, r2, #1
	adds r3, r0, r1
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #4]
	mov r0, sb
	subs r0, #1
	cmp r2, r0
	blt _0800B668
	ldr r1, [r6, #4]
	mov r0, sl
	adds r0, #1
	strh r0, [r1, #4]
	str r7, [r4, #8]
	movs r2, #0
	ldrsh r0, [r3, r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #8]
	b _0800B6A8
_0800B668:
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x14]
	bl sub_80D6378
	ldr r4, [r6, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [r5, #4]
	lsls r3, r2, #1
	adds r1, r3, r1
	ldrh r1, [r1, #2]
	add r1, sl
	subs r1, r1, r0
	strh r1, [r4, #4]
	ldr r1, [r6, #8]
	adds r2, r3, r2
	lsls r2, r2, #2
	ldr r0, [r5, #8]
	adds r0, r0, r2
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r6, #0x10]
	ldr r0, [r5, #0xc]
	adds r3, r3, r0
	movs r1, #2
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
_0800B6A8:
	movs r0, #1
	b _0800B6AE
_0800B6AC:
	movs r0, #0
_0800B6AE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

