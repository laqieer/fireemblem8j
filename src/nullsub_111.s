	.syntax unified
	.section .text.nullsub_111, "ax", %progbits
@ nullsub_111 @ JP 0x080D65F4 - region-different empty function (`bx lr` + `nop`).
@ Reproduced as real source: a C empty function emits only `bx lr`, and the build's
@ `.align 2, 0` zero-pads the trailing halfword, but the ROM has the `c046` thumb nop
@ (alignment to the following libgcc object). The nop is intrinsic, so this is asm.
	.thumb
	.global nullsub_111
	.thumb_func
nullsub_111:
	bx lr
	nop
