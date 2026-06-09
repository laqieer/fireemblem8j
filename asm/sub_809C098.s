	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_809AC94, 0x0809AC94 + 1
	.set sub_809E100, 0x0809E100 + 1
	.section .text.sub_809C098, "ax", %progbits
@ sub_809C098 @ JP 0x0809C098 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C098
	.thumb_func
sub_809C098:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_809AC94
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_809E100
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

