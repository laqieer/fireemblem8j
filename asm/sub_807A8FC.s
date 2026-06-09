	.syntax unified
	.set sub_807B444, 0x0807B444 + 1
	.section .text.sub_807A8FC, "ax", %progbits
@ sub_807A8FC @ JP 0x0807A8FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A8FC
	.thumb_func
sub_807A8FC:
	push {lr}
	bl sub_807B444
	pop {r0}
	bx r0
	.align 2, 0

