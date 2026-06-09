	.syntax unified
	.set Proc_BlockEachMarked, 0x08002F3C + 1
	.section .text.sub_807B4F4, "ax", %progbits
@ sub_807B4F4 @ JP 0x0807B4F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4F4
	.thumb_func
sub_807B4F4:
	push {lr}
	movs r0, #4
	bl Proc_BlockEachMarked
	pop {r0}
	bx r0

