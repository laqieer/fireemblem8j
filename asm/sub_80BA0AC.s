	.syntax unified
	.section .text.sub_80BA0AC, "ax", %progbits
@ sub_80BA0AC @ JP 0x080BA0AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA0AC
	.thumb_func
sub_80BA0AC:
	ldr r1, _080BA0B4 @ =0x0203EFB0
	str r0, [r1]
	bx lr
	.align 2, 0
_080BA0B4: .4byte 0x0203EFB0

