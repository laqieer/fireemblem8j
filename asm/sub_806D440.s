	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806D440, "ax", %progbits
@ sub_806D440 @ JP 0x0806D440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D440
	.thumb_func
sub_806D440:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

