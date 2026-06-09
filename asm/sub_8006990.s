	.syntax unified
	.section .text.sub_8006990, "ax", %progbits
@ sub_8006990 @ JP 0x08006990 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006990
	.thumb_func
sub_8006990:
	ldr r1, _08006998 @ =0x085B90D4
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08006998: .4byte 0x085B90D4

