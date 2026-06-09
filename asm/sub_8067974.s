	.syntax unified
	.section .text.sub_8067974, "ax", %progbits
@ sub_8067974 @ JP 0x08067974 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067974
	.thumb_func
sub_8067974:
	ldr r1, _08067980 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08067980: .4byte 0x0201774C

