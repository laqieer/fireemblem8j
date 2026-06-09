	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8067F68, "ax", %progbits
@ sub_8067F68 @ JP 0x08067F68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067F68
	.thumb_func
sub_8067F68:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	cmp r7, #0
	blt _08067FBA
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r6, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	lsls r4, r7, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_805660C
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl sub_80567E0
	b _08067FD8
_08067FBA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _08067FD8
	bl sub_8056130
	ldr r1, _08067FE0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_08067FD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067FE0: .4byte 0x0201774C

