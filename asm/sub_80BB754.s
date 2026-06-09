	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_80BBF08, 0x080BBF08 + 1
	.section .text.sub_80BB754, "ax", %progbits
@ sub_80BB754 @ JP 0x080BB754 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB754
	.thumb_func
sub_80BB754:
	push {lr}
	sub sp, #4
	movs r0, #0
	bl sub_8001ACC
	bl sub_8010F98
	bl sub_80BBF08
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
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r2, _080BB7B0 @ =0x03003020
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BB7B0: .4byte 0x03003020

