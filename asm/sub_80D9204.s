	.syntax unified
	.section .text.sub_80D9204, "ax", %progbits
@ sub_80D9204 @ JP 0x080D9204 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D9204
	.thumb_func
sub_80D9204:
	ldr r0, _080D9208 @ =0x08577444
	bx lr
	.align 2, 0
_080D9208: .4byte 0x08577444

