	.syntax unified
	.set sub_80B2874, 0x080B2874 + 1
	.set sub_80B75D0, 0x080B75D0 + 1
	.section .text.sub_80B7B1C, "ax", %progbits
@ sub_80B7B1C @ JP 0x080B7B1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7B1C
	.thumb_func
sub_80B7B1C:
	push {lr}
	bl sub_80B2874
	movs r0, #3
	bl sub_80B75D0
	pop {r0}
	bx r0

