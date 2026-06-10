	.syntax unified
	.set sub_80080A4, 0x080080A4 + 1
	.section .text.sub_800E9D4, "ax", %progbits
@ sub_800E9D4 @ JP 0x0800E9D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E9D4
	.thumb_func
sub_800E9D4:
	push {lr}
	bl sub_80080A4
	movs r0, #0
	pop {r1}
	bx r1

