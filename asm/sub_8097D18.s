	.syntax unified
	.set sub_8089078, 0x08089078 + 1
	.section .text.sub_8097D18, "ax", %progbits
@ sub_8097D18 @ JP 0x08097D18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097D18
	.thumb_func
sub_8097D18:
	push {lr}
	bl sub_8089078
	pop {r0}
	bx r0
	.align 2, 0

