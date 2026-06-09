	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806C7A0, "ax", %progbits
@ sub_806C7A0 @ JP 0x0806C7A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C7A0
	.thumb_func
sub_806C7A0:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806C7CA
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl sub_805660C
	b _0806C7E4
_0806C7CA:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806C7E4
	bl sub_8056130
	ldr r1, _0806C7EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806C7E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C7EC: .4byte 0x0201774C

