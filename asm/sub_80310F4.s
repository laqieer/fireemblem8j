	.syntax unified
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_80310C4, 0x080310C4 + 1
	.section .text.sub_80310F4, "ax", %progbits
@ sub_80310F4 @ JP 0x080310F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80310F4
	.thumb_func
sub_80310F4:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	bl sub_8015710
	bl sub_80310C4
	pop {r0}
	bx r0

