	.syntax unified
	.set AddTrap, 0x0802E1F0 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemUses, 0x0801732C + 1
	.set MakeNewItem, 0x080162E8 + 1
	.section .text.sub_8037A9C, "ax", %progbits
@ sub_8037A9C @ JP 0x08037A9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037A9C
	.thumb_func
sub_8037A9C:
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl AddTrap
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIndex
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl MakeNewItem
	bl GetItemUses
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

