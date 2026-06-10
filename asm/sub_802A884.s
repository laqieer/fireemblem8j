	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemType, 0x080172F0 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_802A884, "ax", %progbits
@ sub_802A884 @ JP 0x0802A884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A884
	.thumb_func
sub_802A884:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	bl sub_8037A24
	adds r4, r6, #0
	adds r4, #0x48
	movs r5, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r6, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

