	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_8099D78, "ax", %progbits
@ sub_8099D78 @ JP 0x08099D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099D78
	.thumb_func
sub_8099D78:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

