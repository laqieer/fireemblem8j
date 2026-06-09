	.syntax unified
	.section .text.sub_800D850, "ax", %progbits
@ sub_800D850 @ JP 0x0800D850 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D850
	.thumb_func
sub_800D850:
	ldr r0, _0800D858 @ =0x03000560
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800D858: .4byte 0x03000560

