	.syntax unified
	.set MakeNewItem, 0x080162E8 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set UnitClearInventory, 0x08017714 + 1
	.section .text.sub_8017B18, "ax", %progbits
@ sub_8017B18 @ JP 0x08017B18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017B18
	.thumb_func
sub_8017B18:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl UnitClearInventory
	adds r1, r4, #0
	adds r1, #0xc
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _08017B4C
	adds r4, r1, #0
	adds r6, r4, #0
_08017B30:
	ldrb r0, [r4]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r6, #3
	cmp r4, r0
	bgt _08017B4C
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017B30
_08017B4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

