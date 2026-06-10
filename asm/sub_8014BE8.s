	.syntax unified
	.set StartBgm, 0x08002424 + 1
	.section .text.sub_8014BE8, "ax", %progbits
@ sub_8014BE8 @ JP 0x08014BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014BE8
	.thumb_func
sub_8014BE8:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0

