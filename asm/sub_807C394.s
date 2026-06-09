	.syntax unified
	.set sub_807BF0C, 0x0807BF0C + 1
	.section .text.sub_807C394, "ax", %progbits
@ sub_807C394 @ JP 0x0807C394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C394
	.thumb_func
sub_807C394:
	push {lr}
	bl sub_807BF0C
	pop {r0}
	bx r0
	.align 2, 0

