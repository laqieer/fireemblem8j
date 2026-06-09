	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_800487C, "ax", %progbits
@ sub_800487C @ JP 0x0800487C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800487C
	.thumb_func
sub_800487C:
	push {lr}
	ldr r0, _08004888 @ =0x08577F24
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08004888: .4byte 0x08577F24

