	.syntax unified
	.set sub_8050380, 0x08050380 + 1
	.section .text.sub_800D104, "ax", %progbits
@ sub_800D104 @ JP 0x0800D104 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D104
	.thumb_func
sub_800D104:
	push {lr}
	bl sub_8050380
	pop {r0}
	bx r0
	.align 2, 0

