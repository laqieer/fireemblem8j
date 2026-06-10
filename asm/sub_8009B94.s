	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8009B94, "ax", %progbits
@ sub_8009B94 @ JP 0x08009B94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009B94
	.thumb_func
sub_8009B94:
	push {lr}
	movs r1, #3
	bl Proc_Goto
	pop {r0}
	bx r0

