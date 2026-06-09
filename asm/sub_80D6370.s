	.syntax unified
	.section .text.sub_80D6370, "ax", %progbits
@ sub_80D6370 @ JP 0x080D6370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6370
	.thumb_func
sub_80D6370:
	svc #0xb
	bx lr

