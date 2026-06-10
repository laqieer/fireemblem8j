	.syntax unified
	.section .text.sub_800D4BC, "ax", %progbits
@ sub_800D4BC @ JP 0x0800D4BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D4BC
	.thumb_func
sub_800D4BC:
	ldr r1, _0800D4C4 @ =0x030004B0
	str r0, [r1, #0x30]
	bx lr
	.align 2, 0
_0800D4C4: .4byte 0x030004B0

