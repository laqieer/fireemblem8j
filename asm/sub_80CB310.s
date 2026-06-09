	.syntax unified
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80CB310, "ax", %progbits
@ sub_80CB310 @ JP 0x080CB310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB310
	.thumb_func
sub_80CB310:
	push {lr}
	bl sub_80B2874
	pop {r0}
	bx r0
	.align 2, 0

