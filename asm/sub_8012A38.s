	.syntax unified
	.set sub_8021AE4, 0x08021AE4 + 1
	.section .text.sub_8012A38, "ax", %progbits
@ sub_8012A38 @ JP 0x08012A38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012A38
	.thumb_func
sub_8012A38:
	push {lr}
	bl sub_8021AE4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

