	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BCC90, "ax", %progbits
@ GameIntroHealthSafetyWaitButton @ JP 0x080BCC90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GameIntroHealthSafetyWaitButton
	.thumb_func
GameIntroHealthSafetyWaitButton:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	movs r1, #8
	movs r2, #0x10
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
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, _080BCCE8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080BCCEC @ =0x08AC0EBC
	adds r1, r4, #0
	bl sub_8002BCC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCE8: .4byte 0x03003020
_080BCCEC: .4byte 0x08AC0EBC

