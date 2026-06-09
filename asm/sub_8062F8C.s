	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetEkrMiniAnimLayerFlag, 0x08056914 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_8062F8C, "ax", %progbits
@ sub_8062F8C @ JP 0x08062F8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062F8C
	.thumb_func
sub_8062F8C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063058 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806305C @ =0x08600CC4
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r8, r1
	mov r1, r8
	strh r1, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x44]
	ldr r1, _08063060 @ =0x080E2BF6
	str r1, [r0, #0x48]
	ldr r1, _08063064 @ =0x08600CDC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063068 @ =0x0869D120
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_80567B8
	ldr r3, _0806306C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl SetEkrMiniAnimLayerFlag
	ldrh r1, [r5, #8]
	ldr r7, _08063070 @ =0x0000F3FF
	adds r0, r7, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r6, r1, #0
	orrs r0, r6
	strh r0, [r5, #8]
	ldr r4, _08063074 @ =0x02000010
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08063026
	ldrh r1, [r2, #8]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2, #8]
_08063026:
	bl sub_8056158
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063058: .4byte 0x0201774C
_0806305C: .4byte 0x08600CC4
_08063060: .4byte 0x080E2BF6
_08063064: .4byte 0x08600CDC
_08063068: .4byte 0x0869D120
_0806306C: .4byte 0x03003020
_08063070: .4byte 0x0000F3FF
_08063074: .4byte 0x02000010

