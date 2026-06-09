	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8070A4C, "ax", %progbits
@ sub_8070A4C @ JP 0x08070A4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070A4C
	.thumb_func
sub_8070A4C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08070A9A
	ldr r1, [r7, #0x4c]
	ldr r2, [r7, #0x50]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_805660C
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl sub_80567E0
	b _08070B52
_08070A9A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08070B52
	bl sub_8056130
	bl sub_8056214
	ldr r4, [r7, #0x5c]
	ldr r0, _08070B60 @ =0x02000000
	mov r8, r0
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r6, #0x40
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	ldr r5, _08070B64 @ =0x0000FFF7
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r0, r6
	strh r0, [r2, #0x10]
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r6, r0
	strh r6, [r2, #0x10]
	ldrh r0, [r2]
	ands r5, r0
	strh r5, [r2]
	adds r0, r7, #0
	bl sub_8002DE4
_08070B52:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070B60: .4byte 0x02000000
_08070B64: .4byte 0x0000FFF7

