	.syntax unified
	.set AiGetItemStealRank, 0x0803B79C + 1
	.section .text.sub_803B7D0, "ax", %progbits
@ AiGetUnitStealItemSlot @ JP 0x0803B7D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiGetUnitStealItemSlot
	.thumb_func
AiGetUnitStealItemSlot:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #1
	rsbs r5, r5, #0
	movs r4, #0
_0803B7DC:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0803B808
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	blo _0803B802
	adds r6, r0, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
_0803B802:
	adds r4, #1
	cmp r4, #4
	ble _0803B7DC
_0803B808:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

