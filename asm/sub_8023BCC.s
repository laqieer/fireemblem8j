	.syntax unified
	.set sub_8023318, 0x08023318 + 1
	.section .text.sub_8023BCC, "ax", %progbits
@ sub_8023BCC @ JP 0x08023BCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023BCC
	.thumb_func
sub_8023BCC:
	push {lr}
	bl sub_8023318
	pop {r1}
	bx r1
	.align 2, 0

