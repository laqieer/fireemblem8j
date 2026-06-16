	.syntax unified
	.set EndPrepScreenSpriteDraw, 0x08098F04 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set nullsub_71, 0x08087CB4 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_8098574, "ax", %progbits
@ AtMenu_ResetScreenEffect @ JP 0x08098574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AtMenu_ResetScreenEffect
	.thumb_func
AtMenu_ResetScreenEffect:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80B2874
	bl sub_8097D18
	bl EndPrepScreenSpriteDraw
	movs r0, #0
	bl sub_8001ACC
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
	movs r0, #1
	bl SetBlendBackdropA
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080985BC
	adds r0, r4, #0
	bl nullsub_71
_080985BC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

