	.syntax unified
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80CB228, "ax", %progbits
@ sub_80CB228 @ JP 0x080CB228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB228
	.thumb_func
sub_80CB228:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080CB298 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	ldrb r0, [r4, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r0, _080CB29C @ =0x08B3EDD0
	adds r1, r5, #0
	bl sub_8002BCC
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB298: .4byte 0x03003020
_080CB29C: .4byte 0x08B3EDD0

