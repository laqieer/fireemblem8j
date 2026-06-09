	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804C12C, "ax", %progbits
@ sub_804C12C @ JP 0x0804C12C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C12C
	.thumb_func
sub_804C12C:
	push {lr}
	ldr r0, _0804C13C @ =0x085D42F0
	movs r1, #4
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0804C13C: .4byte 0x085D42F0

