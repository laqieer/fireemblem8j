	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_8014BF8, "ax", %progbits
@ sub_8014BF8 @ JP 0x08014BF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014BF8
	.thumb_func
sub_8014BF8:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_800226C
	pop {r0}
	bx r0
	.align 2, 0

