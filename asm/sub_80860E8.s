	.syntax unified
	.section .text.sub_80860E8, "ax", %progbits
@ sub_80860E8 @ JP 0x080860E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80860E8
	.thumb_func
sub_80860E8:
	ldr r0, _080860EC @ =0x03005240
	bx lr
	.align 2, 0
_080860EC: .4byte 0x03005240

