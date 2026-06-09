	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_80565A8, 0x080565A8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8062804, "ax", %progbits
@ sub_8062804 @ JP 0x08062804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062804
	.thumb_func
sub_8062804:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08062836
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl sub_80565A8
	b _08062868
_08062836:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08062868
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062850
	bl sub_8056130
	bl sub_8056214
_08062850:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _08062870 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_08062868:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062870: .4byte 0x0201774C

