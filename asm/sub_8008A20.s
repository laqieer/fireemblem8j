	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_8008A20, "ax", %progbits
@ sub_8008A20 @ JP 0x08008A20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008A20
	.thumb_func
sub_8008A20:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

