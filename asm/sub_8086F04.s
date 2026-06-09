	.syntax unified
	.set Debug_DecrementUnitStats, 0x08086E98 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.section .text.sub_8086F04, "ax", %progbits
@ sub_8086F04 @ JP 0x08086F04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086F04
	.thumb_func
sub_8086F04:
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl Debug_DecrementUnitStats
	pop {r0}
	bx r0
	.align 2, 0

