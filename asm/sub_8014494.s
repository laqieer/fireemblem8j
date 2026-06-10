	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8014494, "ax", %progbits
@ sub_8014494 @ JP 0x08014494 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014494
	.thumb_func
sub_8014494:
	push {lr}
	ldr r0, _080144A0 @ =0x085C2578
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080144A0: .4byte 0x085C2578

