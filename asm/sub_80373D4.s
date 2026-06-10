	.syntax unified
	.set sub_800D45C, 0x0800D45C + 1
	.section .text.sub_80373D4, "ax", %progbits
@ sub_80373D4 @ JP 0x080373D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80373D4
	.thumb_func
sub_80373D4:
	push {lr}
	bl sub_800D45C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

