	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_809CBFC, 0x0809CBFC + 1
	.section .text.sub_809CCB4, "ax", %progbits
@ sub_809CCB4 @ JP 0x0809CCB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CCB4
	.thumb_func
sub_809CCB4:
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809CBFC
	pop {r0}
	bx r0

