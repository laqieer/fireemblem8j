	.syntax unified
	.section .text.sub_80860F4, "ax", %progbits
@ sub_80860F4 @ JP 0x080860F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80860F4
	.thumb_func
sub_80860F4:
	ldr r0, _080860F8 @ =0x03005260
	bx lr
	.align 2, 0
_080860F8: .4byte 0x03005260

