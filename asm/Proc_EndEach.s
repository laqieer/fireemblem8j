	.syntax unified
	.set sub_8002EE8, 0x08002EE8 + 1
	.section .text.Proc_EndEach, "ax", %progbits
@ Proc_EndEach @ JP 0x08002FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_EndEach
	.thumb_func
Proc_EndEach:
	push {lr}
	ldr r1, _08002FD4 @ =Delete
	bl sub_8002EE8
	pop {r0}
	bx r0
	.align 2, 0
_08002FD4: .4byte 0x08002FBD  @ Delete

