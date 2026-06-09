	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C0F0, "ax", %progbits
@ sub_805C0F0 @ JP 0x0805C0F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C0F0
	.thumb_func
sub_805C0F0:
	push {r4, lr}
	ldr r4, _0805C114 @ =0x0201FB24
	ldr r0, _0805C118 @ =0x085E4064
	movs r1, #3
	bl sub_8002BCC
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805C11C @ =0x080E0036
	str r1, [r0, #0x48]
	ldr r1, _0805C120 @ =0x085E407C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C114: .4byte 0x0201FB24
_0805C118: .4byte 0x085E4064
_0805C11C: .4byte 0x080E0036
_0805C120: .4byte 0x085E407C

