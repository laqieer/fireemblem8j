	.syntax unified
	.section .text.sub_80CC520, "ax", %progbits
@ sub_80CC520 @ JP 0x080CC520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC520
	.thumb_func
sub_80CC520:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

