	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_804C140, "ax", %progbits
@ sub_804C140 @ JP 0x0804C140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C140
	.thumb_func
sub_804C140:
	push {lr}
	ldr r0, _0804C14C @ =0x085D42F0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804C14C: .4byte 0x085D42F0

