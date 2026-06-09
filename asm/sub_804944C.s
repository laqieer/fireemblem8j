	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804944C, "ax", %progbits
@ sub_804944C @ JP 0x0804944C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804944C
	.thumb_func
sub_804944C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804945C @ =0x085D3FC4
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_0804945C: .4byte 0x085D3FC4

