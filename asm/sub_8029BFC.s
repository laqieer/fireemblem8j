	.syntax unified
	.set sub_8034F98, 0x08034F98 + 1
	.section .text.sub_8029BFC, "ax", %progbits
@ sub_8029BFC @ JP 0x08029BFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029BFC
	.thumb_func
sub_8029BFC:
	push {lr}
	bl sub_8034F98
	pop {r1}
	bx r1
	.align 2, 0

