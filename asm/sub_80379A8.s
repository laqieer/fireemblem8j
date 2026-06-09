	.syntax unified
	.set GetHardModeTrapPointer, 0x08085658 + 1
	.set GetTrapPointer, 0x08085640 + 1
	.set sub_80378D8, 0x080378D8 + 1
	.section .text.sub_80379A8, "ax", %progbits
@ sub_80379A8 @ JP 0x080379A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80379A8
	.thumb_func
sub_80379A8:
	push {lr}
	bl GetTrapPointer
	bl sub_80378D8
	bl GetHardModeTrapPointer
	bl sub_80378D8
	pop {r0}
	bx r0
	.align 2, 0

