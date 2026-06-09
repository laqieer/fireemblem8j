	.syntax unified
	.set sub_8002D78, 0x08002D78 + 1
	.section .text.Proc_Run, "ax", %progbits
@ Proc_Run @ JP 0x08002DD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_Run
	.thumb_func
Proc_Run:
	push {lr}
	cmp r0, #0
	beq _08002DDE
	bl sub_8002D78
_08002DDE:
	pop {r0}
	bx r0
	.align 2, 0

