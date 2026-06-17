	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80B3240, 0x080B3240 + 1
	.section .text.sub_8012DB4, "ax", %progbits
@ StartStoneShatterAnim @ JP 0x08012DB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartStoneShatterAnim
	.thumb_func
StartStoneShatterAnim:
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08012E6C @ =0x085BA384
	bl Proc_StartBlocking
	adds r6, r0, #0
	ldr r3, _08012E70 @ =0x03003020
	ldrb r1, [r3, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	lsls r2, r2, #4
	ldr r1, _08012E74 @ =0x0202BCAC
	ldrh r0, [r1, #0xc]
	subs r2, r2, r0
	subs r2, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	lsls r3, r3, #4
	ldrh r0, [r1, #0xe]
	subs r3, r3, r0
	subs r3, #0x18
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08012E78 @ =0x085BA3A4
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r1, #2
	bl sub_80B3240
	ldr r0, _08012E7C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08012E64
	ldr r0, _08012E80 @ =0x000002D6
	bl m4aSongNumStart
_08012E64:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012E6C: .4byte 0x085BA384
_08012E70: .4byte 0x03003020
_08012E74: .4byte 0x0202BCAC
_08012E78: .4byte 0x085BA3A4
_08012E7C: .4byte 0x0202BCEC
_08012E80: .4byte 0x000002D6

