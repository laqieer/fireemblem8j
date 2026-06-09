	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_80096B0, 0x080096B0 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_8098778, "ax", %progbits
@ sub_8098778 @ JP 0x08098778 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098778
	.thumb_func
sub_8098778:
	push {lr}
	sub sp, #4
	bl sub_8091544
	bl sub_8010F98
	bl sub_80096B0
	ldr r3, _080987D4 @ =0x03003020
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
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080987D4: .4byte 0x03003020

