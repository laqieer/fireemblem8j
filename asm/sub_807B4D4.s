	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_807B4D4, "ax", %progbits
@ sub_807B4D4 @ JP 0x0807B4D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4D4
	.thumb_func
sub_807B4D4:
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

