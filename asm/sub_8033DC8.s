	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8033DC8, "ax", %progbits
@ sub_8033DC8 @ JP 0x08033DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033DC8
	.thumb_func
sub_8033DC8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08033DD8 @ =0x08AAFAEC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08033DD8: .4byte 0x08AAFAEC

