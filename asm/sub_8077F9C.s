	.syntax unified
	.set sub_8073E74, 0x08073E74 + 1
	.section .text.sub_8077F9C, "ax", %progbits
@ sub_8077F9C @ JP 0x08077F9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077F9C
	.thumb_func
sub_8077F9C:
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5c
	bl sub_8073E74
	pop {r0}
	bx r0

