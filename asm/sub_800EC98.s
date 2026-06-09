	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set BackupPalette, 0x0800BCF4 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_800EC98, "ax", %progbits
@ sub_800EC98 @ JP 0x0800EC98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800EC98
	.thumb_func
sub_800EC98:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0800ECD8 @ =0x03003020
	ldrb r1, [r5, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r4, #0x29
	ldrb r4, [r4]
	cmp r4, #1
	beq _0800ED36
	cmp r4, #1
	bgt _0800ECDC
	cmp r4, #0
	beq _0800ECE2
	b _0800EDA8
	.align 2, 0
_0800ECD8: .4byte 0x03003020
_0800ECDC:
	cmp r4, #2
	beq _0800ED54
	b _0800EDA8
_0800ECE2:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldrb r1, [r5, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	b _0800EDA8
_0800ED36:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	b _0800ED72
_0800ED54:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
_0800ED72:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldrb r1, [r5, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r2, r0
	strb r2, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
_0800EDA8:
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #0
	movs r1, #6
	bl BackupPalette
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

