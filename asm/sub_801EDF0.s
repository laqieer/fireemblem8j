	.syntax unified
	.section .text.sub_801EDF0, "ax", %progbits
@ sub_801EDF0 @ JP 0x0801EDF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801EDF0
	.thumb_func
sub_801EDF0:
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

