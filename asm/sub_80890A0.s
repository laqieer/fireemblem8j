	.syntax unified
	.section .text.sub_80890A0, "ax", %progbits
@ sub_80890A0 @ JP 0x080890A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80890A0
	.thumb_func
sub_80890A0:
	ldr r1, _080890A8 @ =0x0203E760
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_080890A8: .4byte 0x0203E760

