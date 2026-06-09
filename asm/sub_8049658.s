	.syntax unified
	.set m4aSoundVSyncOn, 0x080D5574 + 1
	.section .text.sub_8049658, "ax", %progbits
@ sub_8049658 @ JP 0x08049658 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049658
	.thumb_func
sub_8049658:
	push {lr}
	bl m4aSoundVSyncOn
	pop {r0}
	bx r0
	.align 2, 0

