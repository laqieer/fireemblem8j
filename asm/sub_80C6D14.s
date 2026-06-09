	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C6D14, "ax", %progbits
@ sub_80C6D14 @ JP 0x080C6D14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6D14
	.thumb_func
sub_80C6D14:
	push {lr}
	ldr r0, _080C6D20 @ =0x08AC24D0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C6D20: .4byte 0x08AC24D0

