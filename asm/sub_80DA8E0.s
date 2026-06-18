	.syntax unified
	.section .text.sub_80DA8E0, "ax", %progbits
@ __errno @ JP 0x080DA8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __errno
	.thumb_func
__errno:
	ldr r0, _080DA8E8 @ =0x08BB8A74
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080DA8E8: .4byte 0x08BB8A74

