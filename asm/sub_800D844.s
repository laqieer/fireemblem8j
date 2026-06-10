	.syntax unified
	.section .text.sub_800D844, "ax", %progbits
@ sub_800D844 @ JP 0x0800D844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D844
	.thumb_func
sub_800D844:
	ldr r1, _0800D84C @ =0x03000560
	str r0, [r1]
	bx lr
	.align 2, 0
_0800D84C: .4byte 0x03000560

