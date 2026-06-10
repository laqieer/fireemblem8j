	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80257C4, 0x080257C4 + 1
	.section .text.sub_80290E0, "ax", %progbits
@ sub_80290E0 @ JP 0x080290E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80290E0
	.thumb_func
sub_80290E0:
	push {lr}
	movs r1, #0x1e
	bl sub_80257C4
	bl GetSelectTargetCount
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

