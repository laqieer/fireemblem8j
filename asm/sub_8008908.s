	.syntax unified
	.section .text.sub_8008908, "ax", %progbits
@ sub_8008908 @ JP 0x08008908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008908
	.thumb_func
sub_8008908:
	adds r2, r0, #0
	ldr r1, _08008910 @ =0x030000E0
	str r2, [r1]
	bx lr
	.align 2, 0
_08008910: .4byte 0x030000E0

