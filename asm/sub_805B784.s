	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805B784, "ax", %progbits
@ sub_805B784 @ JP 0x0805B784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B784
	.thumb_func
sub_805B784:
	push {lr}
	ldr r0, _0805B794 @ =0x0201FB18
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805B794: .4byte 0x0201FB18

