	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80C6190, "ax", %progbits
@ sub_80C6190 @ JP 0x080C6190 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6190
	.thumb_func
sub_80C6190:
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0

