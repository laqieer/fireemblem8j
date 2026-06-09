	.syntax unified
	.section .text.sub_80C0094, "ax", %progbits
@ sub_80C0094 @ JP 0x080C0094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0094
	.thumb_func
sub_80C0094:
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

