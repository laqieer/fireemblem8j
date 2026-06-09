	.syntax unified
	.set sub_8097954, 0x08097954 + 1
	.set sub_8097B9C, 0x08097B9C + 1
	.section .text.sub_809D7E8, "ax", %progbits
@ sub_809D7E8 @ JP 0x0809D7E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D7E8
	.thumb_func
sub_809D7E8:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8097B9C
	bl sub_8097954
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

