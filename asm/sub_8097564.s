	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8097564, "ax", %progbits
@ sub_8097564 @ JP 0x08097564 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097564
	.thumb_func
sub_8097564:
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

