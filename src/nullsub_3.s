	.syntax unified
	.section .text.nullsub_3, "ax", %progbits
@ nullsub_3 @ JP 0x080D668C - region-different empty function returning via the
@ non-interwork `mov pc, lr` idiom (a C empty function emits `bx lr` instead).
@ Trailing halfword is zero-padded. Reproduced as real source.
	.thumb
	.global nullsub_3
	.thumb_func
nullsub_3:
	mov pc, lr
	.align 2, 0
