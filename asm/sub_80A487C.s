	.syntax unified
	.section .text.sub_80A487C, "ax", %progbits
@ sub_80A487C @ JP 0x080A487C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A487C
	.thumb_func
sub_80A487C:
	ldr r0, _080A4884 @ =0x020136E8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A4884: .4byte 0x020136E8

