	.syntax unified
	.section .text.sub_80BE694, "ax", %progbits
@ sub_80BE694 @ JP 0x080BE694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE694
	.thumb_func
sub_80BE694:
	ldr r1, _080BE69C @ =0x03005270
	movs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_080BE69C: .4byte 0x03005270

