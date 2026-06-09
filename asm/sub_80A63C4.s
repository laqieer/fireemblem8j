	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_8085A9C, 0x08085A9C + 1
	.section .text.sub_80A63C4, "ax", %progbits
@ sub_80A63C4 @ JP 0x080A63C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A63C4
	.thumb_func
sub_80A63C4:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	bl sub_8001ACC
	ldr r3, _080A6470 @ =0x03003020
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	bl sub_804F8E0
	bl sub_801569C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerCharId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	movs r2, #3
	ands r2, r0
	adds r2, #1
	adds r0, r4, #0
	bl sub_8085A9C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6470: .4byte 0x03003020

