	.syntax unified
	.set sub_8028738, 0x08028738 + 1
	.section .text.sub_80873F4, "ax", %progbits
@ sub_80873F4 @ JP 0x080873F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80873F4
	.thumb_func
sub_80873F4:
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_8028738
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

