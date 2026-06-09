	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_8076BC4, "ax", %progbits
@ sub_8076BC4 @ JP 0x08076BC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076BC4
	.thumb_func
sub_8076BC4:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

