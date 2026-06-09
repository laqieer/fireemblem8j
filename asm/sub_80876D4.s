	.syntax unified
	.set sub_800142C, 0x0800142C + 1
	.section .text.sub_80876D4, "ax", %progbits
@ sub_80876D4 @ JP 0x080876D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80876D4
	.thumb_func
sub_80876D4:
	push {lr}
	movs r0, #2
	bl sub_800142C
	pop {r0}
	bx r0

