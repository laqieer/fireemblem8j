	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8063078, "ax", %progbits
@ sub_8063078 @ JP 0x08063078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063078
	.thumb_func
sub_8063078:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl GetAnimAnotherSide
	adds r7, r0, #0
	ldr r4, _080630D4 @ =0x02000010
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _080630A8
	ldrh r0, [r4, #8]
	ldr r1, _080630D8 @ =0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4, #8]
_080630A8:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _080630DC
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl sub_805660C
	b _08063146
	.align 2, 0
_080630D4: .4byte 0x02000010
_080630D8: .4byte 0x0000F3FF
_080630DC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08063146
	bl sub_8056130
	ldr r1, _0806314C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, _08063150 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldrh r1, [r6, #8]
	ldr r3, _08063154 @ =0x0000F3FF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0806313C
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_0806313C:
	bl sub_8056214
	adds r0, r5, #0
	bl sub_8002DE4
_08063146:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806314C: .4byte 0x0201774C
_08063150: .4byte 0x03003020
_08063154: .4byte 0x0000F3FF

