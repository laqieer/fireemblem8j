	.syntax unified
	.set Proc_UnblockEachMarked, 0x08002F64 + 1
	.section .text.sub_807B500, "ax", %progbits
@ sub_807B500 @ JP 0x0807B500 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B500
	.thumb_func
sub_807B500:
	push {lr}
	movs r0, #4
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

