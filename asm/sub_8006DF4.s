	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8006DF4, "ax", %progbits
@ sub_8006DF4 @ JP 0x08006DF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006DF4
	.thumb_func
sub_8006DF4:
	push {lr}
	ldr r0, _08006E00 @ =0x085B9120
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08006E00: .4byte 0x085B9120

