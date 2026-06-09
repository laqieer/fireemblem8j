	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806D3D0, "ax", %progbits
@ sub_806D3D0 @ JP 0x0806D3D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D3D0
	.thumb_func
sub_806D3D0:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806D418
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r5, r6
	ldr r2, [r5]
	adds r1, r2, #0
	bl sub_805660C
	b _0806D436
_0806D418:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806D436
	bl sub_8056130
	ldr r1, _0806D43C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r7, #0
	bl sub_8002DE4
_0806D436:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D43C: .4byte 0x0201774C

