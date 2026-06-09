	.syntax unified
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80736C4, "ax", %progbits
@ sub_80736C4 @ JP 0x080736C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80736C4
	.thumb_func
sub_80736C4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x38]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	cmp r3, #0
	beq _08073788
	str r3, [sp, #0x10]
_080736EE:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	mov r3, sb
	ands r3, r0
	mov sb, r3
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	str r7, [sp]
	movs r0, #0
	mov r3, sl
	bl sub_8012E84
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r7, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	mov r3, sl
	bl sub_8012E84
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r7, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	mov r3, sl
	bl sub_8012E84
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #4]
	adds r2, #2
	str r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r3, #2
	str r3, [sp, #8]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _080736EE
_08073788:
	cmp sl, r7
	beq _08073790
	movs r0, #0
	b _08073792
_08073790:
	movs r0, #1
_08073792:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

