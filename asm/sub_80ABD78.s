	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80ABD78, "ax", %progbits
@ sub_80ABD78 @ JP 0x080ABD78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABD78
	.thumb_func
sub_80ABD78:
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x94
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0

