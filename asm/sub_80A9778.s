	.syntax unified
	.section .text.sub_80A9778, "ax", %progbits
@ sub_80A9778 @ JP 0x080A9778 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9778
	.thumb_func
sub_80A9778:
	ldr r1, _080A9780 @ =0x0203EDB0
	str r0, [r1]
	bx lr
	.align 2, 0
_080A9780: .4byte 0x0203EDB0

