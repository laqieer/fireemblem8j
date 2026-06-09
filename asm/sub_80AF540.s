	.syntax unified
	.set EndBgVerticalScroll, 0x08014E64 + 1
	.section .text.sub_80AF540, "ax", %progbits
@ sub_80AF540 @ JP 0x080AF540 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF540
	.thumb_func
sub_80AF540:
	push {lr}
	bl EndBgVerticalScroll
	pop {r0}
	bx r0
	.align 2, 0

