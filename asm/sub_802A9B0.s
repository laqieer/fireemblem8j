	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_802A9B0, "ax", %progbits
@ sub_802A9B0 @ JP 0x0802A9B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A9B0
	.thumb_func
sub_802A9B0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0802A9D6
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _0802AA02
_0802A9D6:
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0802A9F4
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _0802AA02
_0802A9F4:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	ldrsb r1, [r4, r1]
_0802AA02:
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5c
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

