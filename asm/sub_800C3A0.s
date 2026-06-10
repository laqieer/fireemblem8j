	.syntax unified
	.section .text.sub_800C3A0, "ax", %progbits
@ sub_800C3A0 @ JP 0x0800C3A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C3A0
	.thumb_func
sub_800C3A0:
	ldr r1, _0800C3A8 @ =0x03005270
	movs r0, #0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0800C3A8: .4byte 0x03005270

