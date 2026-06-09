	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C4AE4, "ax", %progbits
@ sub_80C4AE4 @ JP 0x080C4AE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4AE4
	.thumb_func
sub_80C4AE4:
	push {lr}
	ldr r0, _080C4AF0 @ =0x08AC1FA4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4AF0: .4byte 0x08AC1FA4

