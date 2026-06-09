	.syntax unified
	.section .text.sub_8070F08, "ax", %progbits
@ sub_8070F08 @ JP 0x08070F08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070F08
	.thumb_func
sub_8070F08:
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr
	.align 2, 0

