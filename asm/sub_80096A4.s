	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80096A4, "ax", %progbits
@ sub_80096A4 @ JP 0x080096A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80096A4
	.thumb_func
sub_80096A4:
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

