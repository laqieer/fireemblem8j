	.syntax unified
	.set sub_80345E8, 0x080345E8 + 1
	.section .text.sub_80AB73C, "ax", %progbits
@ sub_80AB73C @ JP 0x080AB73C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB73C
	.thumb_func
sub_80AB73C:
	push {lr}
	bl sub_80345E8
	pop {r1}
	bx r1
	.align 2, 0

