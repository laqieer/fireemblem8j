	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80CEEB4, "ax", %progbits
@ sub_80CEEB4 @ JP 0x080CEEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CEEB4
	.thumb_func
sub_80CEEB4:
	push {r4, lr}
	sub sp, #4
	ldr r0, _080CEF40 @ =0x08BAA1E0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r3, _080CEF44 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CEF40: .4byte 0x08BAA1E0
_080CEF44: .4byte 0x03003020

