	.syntax unified
	.section .text.sub_8001408, "ax", %progbits
@ sub_8001408 @ JP 0x08001408 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001408
	.thumb_func
sub_8001408:
	ldr r0, _08001410 @ =0x0300000E
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08001410: .4byte 0x0300000E

