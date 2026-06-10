	.syntax unified
	.set sub_80378C8, 0x080378C8 + 1
	.section .text.sub_80325A4, "ax", %progbits
@ sub_80325A4 @ JP 0x080325A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80325A4
	.thumb_func
sub_80325A4:
	push {lr}
	ldr r1, [r0, #0x2c]
	bl sub_80378C8
	pop {r0}
	bx r0

