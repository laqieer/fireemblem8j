	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_802DDCC, "ax", %progbits
@ sub_802DDCC @ JP 0x0802DDCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DDCC
	.thumb_func
sub_802DDCC:
	push {lr}
	ldr r0, _0802DDD8 @ =0x085C40D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0802DDD8: .4byte 0x085C40D4

