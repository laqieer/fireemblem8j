	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_809EF94, 0x0809EF94 + 1
	.section .text.sub_809C0C8, "ax", %progbits
@ sub_809C0C8 @ JP 0x0809C0C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C0C8
	.thumb_func
sub_809C0C8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_809EF94
	pop {r4}
	pop {r0}
	bx r0

