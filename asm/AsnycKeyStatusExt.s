	.syntax unified
	.section .text.AsnycKeyStatusExt, "ax", %progbits
@ AsnycKeyStatusExt @ JP 0x08001414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AsnycKeyStatusExt
	.thumb_func
AsnycKeyStatusExt:
	ldr r1, _08001428 @ =0x085775CC
	ldr r2, [r1]
	adds r0, #0x64
	ldrh r1, [r0]
	strh r1, [r2, #8]
	ldrh r1, [r0]
	strh r1, [r2, #6]
	ldrh r0, [r0]
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_08001428: .4byte 0x085775CC

