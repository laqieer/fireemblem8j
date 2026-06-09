	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80BD55C, "ax", %progbits
@ sub_80BD55C @ JP 0x080BD55C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD55C
	.thumb_func
sub_80BD55C:
	push {lr}
	ldr r0, _080BD568 @ =0x08AC10C0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080BD568: .4byte 0x08AC10C0

