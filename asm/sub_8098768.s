	.syntax unified
	.set sub_8031568, 0x08031568 + 1
	.section .text.sub_8098768, "ax", %progbits
@ sub_8098768 @ JP 0x08098768 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098768
	.thumb_func
sub_8098768:
	push {lr}
	bl sub_8031568
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

