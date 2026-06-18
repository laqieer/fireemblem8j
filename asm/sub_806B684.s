	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056708, 0x08056708 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_806BA18, 0x0806BA18 + 1
	.section .text.sub_806B684, "ax", %progbits
@ efxDarkGradoBG02_Loop_A @ JP 0x0806B684 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxDarkGradoBG02_Loop_A
	.thumb_func
efxDarkGradoBG02_Loop_A:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r5, #0
	cmp r5, #0
	blt _0806B6CC
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
	adds r5, r5, r6
	ldr r1, [r5]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8056708
	b _0806B6EE
_0806B6CC:
	movs r0, #6
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806B6E0
	bl sub_806BA18
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	b _0806B6EE
_0806B6E0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806B6EE
	adds r0, r7, #0
	bl sub_8002DE4
_0806B6EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

