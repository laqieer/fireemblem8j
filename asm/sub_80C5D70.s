	.syntax unified
	.set sub_800125C, 0x0800125C + 1
	.section .text.sub_80C5D70, "ax", %progbits
@ sub_80C5D70 @ JP 0x080C5D70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5D70
	.thumb_func
sub_80C5D70:
	push {lr}
	movs r0, #0
	bl sub_800125C
	pop {r0}
	bx r0

