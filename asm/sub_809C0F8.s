	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_80A29A8, 0x080A29A8 + 1
	.section .text.sub_809C0F8, "ax", %progbits
@ sub_809C0F8 @ JP 0x0809C0F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C0F8
	.thumb_func
sub_809C0F8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_80A29A8
	pop {r4}
	pop {r0}
	bx r0

