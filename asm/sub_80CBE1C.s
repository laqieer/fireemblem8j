	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80CBE1C, "ax", %progbits
@ sub_80CBE1C @ JP 0x080CBE1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBE1C
	.thumb_func
sub_80CBE1C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #1
	movs r1, #8
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r2, _080CBE78 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBE78: .4byte 0x03003020

