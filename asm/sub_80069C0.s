	.syntax unified
	.section .text.sub_80069C0, "ax", %progbits
@ sub_80069C0 @ JP 0x080069C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80069C0
	.thumb_func
sub_80069C0:
	ldr r1, _080069C8 @ =0x085B90D4
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_080069C8: .4byte 0x085B90D4

