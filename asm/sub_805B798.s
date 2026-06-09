	.syntax unified
	.set AnimUpdateAll, 0x08004D48 + 1
	.section .text.sub_805B798, "ax", %progbits
@ sub_805B798 @ JP 0x0805B798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B798
	.thumb_func
sub_805B798:
	push {lr}
	bl AnimUpdateAll
	pop {r0}
	bx r0
	.align 2, 0

