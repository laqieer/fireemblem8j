	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002330, 0x08002330 + 1
	.section .text.sub_80BED38, "ax", %progbits
@ sub_80BED38 @ JP 0x080BED38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BED38
	.thumb_func
sub_80BED38:
	push {lr}
	sub sp, #4
	ldr r2, _080BED98 @ =0x03003020
	ldrb r1, [r2, #1]
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
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl sub_800226C
	movs r0, #1
	bl sub_8002330
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BED98: .4byte 0x03003020

