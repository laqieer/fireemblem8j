	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C7498, "ax", %progbits
@ sub_80C7498 @ JP 0x080C7498 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7498
	.thumb_func
sub_80C7498:
	push {lr}
	ldr r0, _080C74A4 @ =0x08AC25A8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C74A4: .4byte 0x08AC25A8

