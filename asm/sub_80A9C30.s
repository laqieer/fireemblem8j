	.syntax unified
	.set sub_80A793C, 0x080A793C + 1
	.section .text.sub_80A9C30, "ax", %progbits
@ sub_80A9C30 @ JP 0x080A9C30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9C30
	.thumb_func
sub_80A9C30:
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_80A793C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

