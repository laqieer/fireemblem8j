	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.section .text.sub_8040280, "ax", %progbits
@ sub_8040280 @ JP 0x08040280 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040280
	.thumb_func
sub_8040280:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804029C @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_802CC14
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _080402A0
	movs r0, #0
	b _080402CC
	.align 2, 0
_0804029C: .4byte 0x03004DF0
_080402A0:
	adds r0, r5, #0
	bl sub_8018EC4
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080402CA
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080402CA
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_080402CA:
	adds r0, r4, #0
_080402CC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

