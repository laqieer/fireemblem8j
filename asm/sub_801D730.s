	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_801D730, "ax", %progbits
@ sub_801D730 @ JP 0x0801D730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D730
	.thumb_func
sub_801D730:
	push {lr}
	ldr r0, _0801D73C @ =0x085C31D0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801D73C: .4byte 0x085C31D0

