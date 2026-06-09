	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80BD0CC, "ax", %progbits
@ sub_80BD0CC @ JP 0x080BD0CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD0CC
	.thumb_func
sub_80BD0CC:
	push {lr}
	movs r0, #4
	bl sub_800226C
	pop {r0}
	bx r0

