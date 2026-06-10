	.syntax unified
	.set sub_8009E68, 0x08009E68 + 1
	.section .text.sub_801C130, "ax", %progbits
@ sub_801C130 @ JP 0x0801C130 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C130
	.thumb_func
sub_801C130:
	push {lr}
	bl sub_8009E68
	movs r0, #7
	pop {r1}
	bx r1

