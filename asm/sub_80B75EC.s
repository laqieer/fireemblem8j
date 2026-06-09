	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80B75EC, "ax", %progbits
@ sub_80B75EC @ JP 0x080B75EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B75EC
	.thumb_func
sub_80B75EC:
	push {lr}
	movs r0, #3
	bl sub_800226C
	pop {r0}
	bx r0

