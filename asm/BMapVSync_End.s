	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.BMapVSync_End, "ax", %progbits
@ BMapVSync_End @ JP 0x080300C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BMapVSync_End
	.thumb_func
BMapVSync_End:
	push {lr}
	ldr r0, _080300D0 @ =0x085C5D98
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080300D0: .4byte 0x085C5D98

