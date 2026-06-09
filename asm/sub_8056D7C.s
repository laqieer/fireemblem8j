	.syntax unified
	.set BMapDispSuspend, 0x080300D4 + 1
	.set InitOam, 0x0800204C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8056D7C, "ax", %progbits
@ sub_8056D7C @ JP 0x08056D7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056D7C
	.thumb_func
sub_8056D7C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r2, [r7, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	beq _08056D9A
	adds r0, r2, #1
	strh r0, [r7, #0x2c]
_08056D9A:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	adds r6, r0, #0
	movs r3, #0x3a
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	adds r5, r0, #0
	movs r3, #0x34
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl sub_8012E84
	adds r4, r0, #0
	movs r3, #0x3c
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl sub_8012E84
	ldr r2, _08056E80 @ =0x03003020
	movs r3, #0x2d
	adds r3, r3, r2
	mov r8, r3
	movs r1, #0
	mov sb, r1
	strb r6, [r3]
	adds r6, r2, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r2, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r2, #0
	adds r4, #0x30
	strb r0, [r4]
	movs r3, #0x2c
	ldrsh r1, [r7, r3]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bne _08056E72
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl BMapDispSuspend
	mov r1, sb
	mov r0, r8
	strb r1, [r0]
	strb r1, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, _08056E84 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl sub_80737A4
	bl sub_8001EE4
	bl sub_807B4B8
	adds r0, r7, #0
	bl sub_8002DE4
_08056E72:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056E80: .4byte 0x03003020
_08056E84: .4byte 0x020228A8

