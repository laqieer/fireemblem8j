	.syntax unified
	.set sub_809F968, 0x0809F968 + 1
	.section .text.sub_80A055C, "ax", %progbits
@ sub_80A055C @ JP 0x080A055C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A055C
	.thumb_func
sub_80A055C:
	push {lr}
	bl sub_809F968
	pop {r0}
	bx r0
	.align 2, 0

