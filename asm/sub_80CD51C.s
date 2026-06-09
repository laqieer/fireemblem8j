	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.section .text.sub_80CD51C, "ax", %progbits
@ sub_80CD51C @ JP 0x080CD51C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD51C
	.thumb_func
sub_80CD51C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0xe
	bl SetBlendConfig
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

