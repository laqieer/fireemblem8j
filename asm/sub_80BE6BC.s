	.syntax unified
	.set sub_809448C, 0x0809448C + 1
	.section .text.sub_80BE6BC, "ax", %progbits
@ sub_80BE6BC @ JP 0x080BE6BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE6BC
	.thumb_func
sub_80BE6BC:
	push {lr}
	bl sub_809448C
	pop {r0}
	bx r0
	.align 2, 0

