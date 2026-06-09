	.syntax unified
	.set SavePlayThroughData, 0x080A9658 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.section .text.sub_8031420, "ax", %progbits
@ sub_8031420 @ JP 0x08031420 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031420
	.thumb_func
sub_8031420:
	push {lr}
	movs r0, #3
	bl SetNextGameActionId
	bl SavePlayThroughData
	pop {r0}
	bx r0

