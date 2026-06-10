	.syntax unified
	.section .text.sub_8031430, "ax", %progbits
@ sub_8031430 @ JP 0x08031430 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031430
	.thumb_func
sub_8031430:
	ldr r0, _08031434 @ =0x0202BD0C
	bx lr
	.align 2, 0
_08031434: .4byte 0x0202BD0C

