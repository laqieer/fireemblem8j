	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_801419C, "ax", %progbits
@ sub_801419C @ JP 0x0801419C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801419C
	.thumb_func
sub_801419C:
	push {lr}
	ldr r0, _080141A8 @ =0x085C2528
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080141A8: .4byte 0x085C2528

