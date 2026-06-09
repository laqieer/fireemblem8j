	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_801E6AC, "ax", %progbits
@ sub_801E6AC @ JP 0x0801E6AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801E6AC
	.thumb_func
sub_801E6AC:
	push {lr}
	ldr r0, _0801E6B8 @ =0x085C3308
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801E6B8: .4byte 0x085C3308

