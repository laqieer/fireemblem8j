	.syntax unified
	.set m4aSongNumStop, 0x080D4FC0 + 1
	.section .text.sub_8073F28, "ax", %progbits
@ sub_8073F28 @ JP 0x08073F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073F28
	.thumb_func
sub_8073F28:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0

