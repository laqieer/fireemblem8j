	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8067EA4, "ax", %progbits
@ sub_8067EA4 @ JP 0x08067EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067EA4
	.thumb_func
sub_8067EA4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	cmp r5, #0
	blt _08067EDC
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_805660C
	b _08067EFA
_08067EDC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08067EFA
	bl sub_8056130
	ldr r1, _08067F00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_08067EFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067F00: .4byte 0x0201774C

