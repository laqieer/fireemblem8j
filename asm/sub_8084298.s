	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_8084298, "ax", %progbits
@ sub_8084298 @ JP 0x08084298 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084298
	.thumb_func
sub_8084298:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

