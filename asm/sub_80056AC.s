	.syntax unified
	.section .text.sub_80056AC, "ax", %progbits
@ sub_80056AC @ JP 0x080056AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80056AC
	.thumb_func
sub_80056AC:
	ldr r0, [r0, #0x30]
	bx lr

