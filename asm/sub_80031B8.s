	.syntax unified
	.set Proc_GotoScript, 0x08002EAC + 1
	.section .text.sub_80031B8, "ax", %progbits
@ sub_80031B8 @ JP 0x080031B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80031B8
	.thumb_func
sub_80031B8:
	push {lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #4]
	bl Proc_GotoScript
	movs r0, #1
	pop {r1}
	bx r1

