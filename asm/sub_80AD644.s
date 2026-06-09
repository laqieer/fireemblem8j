	.syntax unified
	.set InitSaveMenuHelpTextSt, 0x080AF1E0 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.section .text.sub_80AD644, "ax", %progbits
@ sub_80AD644 @ JP 0x080AD644 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD644
	.thumb_func
sub_80AD644:
	push {r4, lr}
	sub sp, #4
	bl InitSaveMenuHelpTextSt
	ldr r0, _080AD6E4 @ =0x08A9CF7C
	bl sub_8001ACC
	ldr r3, _080AD6E8 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3]
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
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD6E4: .4byte 0x08A9CF7C
_080AD6E8: .4byte 0x03003020

