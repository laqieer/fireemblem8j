	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.section .text.sub_8019174, "ax", %progbits
@ sub_8019174 @ JP 0x08019174 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019174
	.thumb_func
sub_8019174:
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0801918C
	movs r1, #1
_0801918C:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

