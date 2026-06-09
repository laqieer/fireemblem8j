	.syntax unified
	.section .text.sub_808B54C, "ax", %progbits
@ sub_808B54C @ JP 0x0808B54C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B54C
	.thumb_func
sub_808B54C:
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

