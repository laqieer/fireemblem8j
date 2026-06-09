	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8061354, "ax", %progbits
@ sub_8061354 @ JP 0x08061354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061354
	.thumb_func
sub_8061354:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne _0806137A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08061380 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806137A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061380: .4byte 0x0201774C

