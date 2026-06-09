	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80C7370, "ax", %progbits
@ sub_80C7370 @ JP 0x080C7370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7370
	.thumb_func
sub_80C7370:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	strh r5, [r4, #0x2a]
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

