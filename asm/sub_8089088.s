	.syntax unified
	.section .text.sub_8089088, "ax", %progbits
@ sub_8089088 @ JP 0x08089088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089088
	.thumb_func
sub_8089088:
	ldr r0, _08089090 @ =0x0203E760
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_08089090: .4byte 0x0203E760

