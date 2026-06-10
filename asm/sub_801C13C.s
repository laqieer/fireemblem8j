	.syntax unified
	.set sub_8001C00, 0x08001C00 + 1
	.section .text.sub_801C13C, "ax", %progbits
@ sub_801C13C @ JP 0x0801C13C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C13C
	.thumb_func
sub_801C13C:
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl sub_8001C00
	movs r0, #0x17
	pop {r1}
	bx r1

