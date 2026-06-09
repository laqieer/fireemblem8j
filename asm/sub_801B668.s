	.syntax unified
	.section .text.sub_801B668, "ax", %progbits
@ sub_801B668 @ JP 0x0801B668 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B668
	.thumb_func
sub_801B668:
	ldr r1, _0801B670 @ =0x03004940
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B670: .4byte 0x03004940

