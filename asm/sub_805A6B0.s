	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805A6B0, "ax", %progbits
@ sub_805A6B0 @ JP 0x0805A6B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805A6B0
	.thumb_func
sub_805A6B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805A6C4 @ =0x085E3FC4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6C4: .4byte 0x085E3FC4

