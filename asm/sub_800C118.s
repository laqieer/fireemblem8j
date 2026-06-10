	.syntax unified
	.set sub_80BEEB8, 0x080BEEB8 + 1
	.section .text.sub_800C118, "ax", %progbits
@ sub_800C118 @ JP 0x0800C118 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C118
	.thumb_func
sub_800C118:
	push {lr}
	bl sub_80BEEB8
	movs r0, #0
	pop {r1}
	bx r1

