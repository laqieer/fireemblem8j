	.syntax unified
	.set sub_8032DCC, 0x08032DCC + 1
	.set sub_803309C, 0x0803309C + 1
	.section .text.sub_8033158, "ax", %progbits
@ sub_8033158 @ JP 0x08033158 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033158
	.thumb_func
sub_8033158:
	push {lr}
	bl sub_8032DCC
	bl sub_803309C
	pop {r0}
	bx r0
	.align 2, 0

