	.syntax unified
	.set sub_80263B8, 0x080263B8 + 1
	.section .text.sub_802E954, "ax", %progbits
@ sub_802E954 @ JP 0x0802E954 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E954
	.thumb_func
sub_802E954:
	push {lr}
	movs r0, #3
	bl sub_80263B8
	pop {r0}
	bx r0

