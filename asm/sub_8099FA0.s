	.syntax unified
	.set GetConvoyItemCount, 0x080314BC + 1
	.section .text.sub_8099FA0, "ax", %progbits
@ sub_8099FA0 @ JP 0x08099FA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099FA0
	.thumb_func
sub_8099FA0:
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

