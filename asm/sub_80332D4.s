	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80332D4, "ax", %progbits
@ sub_80332D4 @ JP 0x080332D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80332D4
	.thumb_func
sub_80332D4:
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

