	.syntax unified
	.section .text.sub_801EC40, "ax", %progbits
@ sub_801EC40 @ JP 0x0801EC40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801EC40
	.thumb_func
sub_801EC40:
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

