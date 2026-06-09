	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80975A0, "ax", %progbits
@ sub_80975A0 @ JP 0x080975A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80975A0
	.thumb_func
sub_80975A0:
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

