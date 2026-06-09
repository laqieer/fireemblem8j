	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_801915C, 0x0801915C + 1
	.set sub_8099FA0, 0x08099FA0 + 1
	.section .text.sub_809C804, "ax", %progbits
@ sub_809C804 @ JP 0x0809C804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C804
	.thumb_func
sub_809C804:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl sub_8099FA0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809C83A
	cmp r6, #0x63
	bgt _0809C83A
_0809C820:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl sub_801915C
	adds r4, #1
	cmp r4, r7
	bge _0809C83A
	adds r0, r4, r6
	cmp r0, #0x63
	ble _0809C820
_0809C83A:
	cmp r4, #0
	bgt _0809C842
	movs r0, #0
	b _0809C844
_0809C842:
	movs r0, #1
_0809C844:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

