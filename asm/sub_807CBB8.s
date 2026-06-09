	.syntax unified
	.set ResetText, 0x08003BC4 + 1
	.section .text.sub_807CBB8, "ax", %progbits
@ sub_807CBB8 @ JP 0x0807CBB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CBB8
	.thumb_func
sub_807CBB8:
	push {lr}
	bl ResetText
	pop {r0}
	bx r0
	.align 2, 0

