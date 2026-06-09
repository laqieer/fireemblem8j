	.syntax unified
	.section .text.sub_8089094, "ax", %progbits
@ sub_8089094 @ JP 0x08089094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089094
	.thumb_func
sub_8089094:
	ldr r1, _0808909C @ =0x0203E760
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0808909C: .4byte 0x0203E760

