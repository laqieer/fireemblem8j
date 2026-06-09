	.syntax unified
	.set sub_8037720, 0x08037720 + 1
	.section .text.sub_80378C8, "ax", %progbits
@ sub_80378C8 @ JP 0x080378C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80378C8
	.thumb_func
sub_80378C8:
	push {lr}
	movs r2, #3
	bl sub_8037720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

