	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C2F8, "ax", %progbits
@ sub_805C2F8 @ JP 0x0805C2F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C2F8
	.thumb_func
sub_805C2F8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805C320 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C324 @ =0x085FF200
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C320: .4byte 0x0201774C
_0805C324: .4byte 0x085FF200

