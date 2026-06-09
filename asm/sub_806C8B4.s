	.syntax unified
	.set sub_8002100, 0x08002100 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_806C8B4, "ax", %progbits
@ sub_806C8B4 @ JP 0x0806C8B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C8B4
	.thumb_func
sub_806C8B4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r7, r1, #0
	adds r3, r2, #0
	cmp r3, #0x2d
	ble _0806C8CC
	movs r0, #0x5a
	subs r3, r0, r3
_0806C8CC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	movs r2, #0x80
	bl sub_8012E84
	muls r0, r7, r0
	asrs r7, r0, #8
	cmp r7, #1
	bgt _0806C8E6
	movs r7, #2
_0806C8E6:
	ldr r4, _0806C954 @ =0x080DC15C
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C954: .4byte 0x080DC15C

