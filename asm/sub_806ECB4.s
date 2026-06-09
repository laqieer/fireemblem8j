	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806ECB4, "ax", %progbits
@ sub_806ECB4 @ JP 0x0806ECB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806ECB4
	.thumb_func
sub_806ECB4:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806ECE2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_805660C
	b _0806ED00
_0806ECE2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806ED00
	bl sub_8056130
	ldr r1, _0806ED08 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0806ED00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED08: .4byte 0x0201774C

