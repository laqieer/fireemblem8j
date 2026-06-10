	.syntax unified
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D63D4, 0x080D63D4 + 1
	.section .text.sub_801E6BC, "ax", %progbits
@ sub_801E6BC @ JP 0x0801E6BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801E6BC
	.thumb_func
sub_801E6BC:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r2, #0
	mov r8, r2
	strh r0, [r4, #0x30]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl sub_80D63D4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0x80
	lsls r2, r2, #0xa
	movs r6, #0x80
	lsls r6, r6, #2
	str r6, [sp]
	movs r0, #0
	adds r3, r5, #0
	bl sub_8012E84
	str r0, [r4, #0x44]
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0x30
	adds r3, r5, #0
	bl sub_8012E84
	strh r0, [r4, #0x3e]
	mov r3, r8
	strh r3, [r4, #0x3c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

