	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80146B4, 0x080146B4 + 1
	.section .text.sub_804CE18, "ax", %progbits
@ sub_804CE18 @ JP 0x0804CE18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CE18
	.thumb_func
sub_804CE18:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0804CEB8 @ =0x02023CA8
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, _0804CEBC @ =0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0804CEC0 @ =0x08A1EB2C
	str r4, [sp, #8]
	ldr r6, _0804CEC4 @ =0x085D48F8
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146B4
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0804CE64
	adds r0, r7, #0
	bl sub_8002DE4
_0804CE64:
	ldr r2, _0804CEC8 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CEB8: .4byte 0x02023CA8
_0804CEBC: .4byte 0x00003220
_0804CEC0: .4byte 0x08A1EB2C
_0804CEC4: .4byte 0x085D48F8
_0804CEC8: .4byte 0x03003020

