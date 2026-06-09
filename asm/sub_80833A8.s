	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80833A8, "ax", %progbits
@ sub_80833A8 @ JP 0x080833A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80833A8
	.thumb_func
sub_80833A8:
	push {lr}
	ldr r0, _080833B4 @ =0x08A14D94
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080833B4: .4byte 0x08A14D94

