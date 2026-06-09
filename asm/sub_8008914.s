	.syntax unified
	.section .text.sub_8008914, "ax", %progbits
@ sub_8008914 @ JP 0x08008914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008914
	.thumb_func
sub_8008914:
	ldr r1, _0800891C @ =0x085B90D4
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_0800891C: .4byte 0x085B90D4

