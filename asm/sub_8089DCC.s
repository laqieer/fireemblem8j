	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_8089DCC, "ax", %progbits
@ sub_8089DCC @ JP 0x08089DCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089DCC
	.thumb_func
sub_8089DCC:
	push {r4, lr}
	sub sp, #4
	ldr r3, _08089E28 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r1, r0, #0
	adds r1, #0x4c
	movs r4, #0
	strh r4, [r1]
	adds r0, #0x4e
	strh r4, [r0]
	ldrb r1, [r1]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089E28: .4byte 0x03003020

