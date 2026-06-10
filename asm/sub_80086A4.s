	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80086A4, "ax", %progbits
@ sub_80086A4 @ JP 0x080086A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80086A4
	.thumb_func
sub_80086A4:
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x58]
	movs r0, #0x80
	lsls r0, r0, #1
	bl CheckTalkFlag
	cmp r0, #0
	bne _080086FE
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	ldr r1, _08008704 @ =0x03003020
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
_080086FE:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08008704: .4byte 0x03003020

