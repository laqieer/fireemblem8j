	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8014760, "ax", %progbits
@ sub_8014760 @ JP 0x08014760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014760
	.thumb_func
sub_8014760:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x3c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r6, [sp, #0x38]
	ldrb r0, [r6]
	adds r0, #1
	mov sb, r0
	adds r6, #2
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80D6374
	adds r1, r4, #0
	muls r1, r0, r1
	subs r5, r5, r1
	mov r1, r8
	muls r1, r5, r1
	lsls r1, r1, #1
	adds r1, r6, r1
	ldr r2, [sp, #0x34]
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r6, r1, r0
	movs r5, #0
	cmp r5, r2
	bge _08014806
	mov r7, sl
	lsls r7, r7, #1
	mov ip, r7
_080147BA:
	movs r4, #0
	adds r0, r5, #1
	str r0, [sp, #0xc]
	cmp r4, r8
	bge _080147FE
	ldr r1, [sp, #0x34]
	subs r0, r1, r5
	subs r0, #1
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #1
	adds r3, r6, r0
	ldr r2, [sp]
	add r2, ip
_080147D8:
	mov r7, sl
	adds r0, r7, r4
	cmp r0, #0x1f
	bhi _080147F4
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _080147F4
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	ldr r7, [sp, #8]
	adds r0, r7, r0
	strh r0, [r1]
_080147F4:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _080147D8
_080147FE:
	ldr r5, [sp, #0xc]
	ldr r0, [sp, #0x34]
	cmp r5, r0
	blt _080147BA
_08014806:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

