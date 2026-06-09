	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805D6A0, "ax", %progbits
@ sub_805D6A0 @ JP 0x0805D6A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805D6A0
	.thumb_func
sub_805D6A0:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0805D6C6
	ldr r0, _0805D6CC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0805D6C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D6CC: .4byte 0x0201774C

