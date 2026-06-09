	.syntax unified
	.set GetItemCost, 0x080173E4 + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_801915C, 0x0801915C + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB70, 0x0802CB70 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DA2C, 0x0807DA2C + 1
	.section .text.sub_80323C8, "ax", %progbits
@ sub_80323C8 @ JP 0x080323C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80323C8
	.thumb_func
sub_80323C8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _08032440 @ =0x0203A954
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080323F8
	ldrb r4, [r4, #0x12]
	adds r0, r5, #0
	bl GetUnitItemCount
	subs r0, #1
	cmp r4, r0
	bne _080323F8
	ldr r0, [r5, #0xc]
	ldr r1, _08032444 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r5, #0xc]
_080323F8:
	ldr r4, _08032440 @ =0x0203A954
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_801915C
	movs r0, #0xff
	ands r0, r6
	cmp r0, #0x9a
	blt _08032448
	cmp r0, #0xa0
	ble _0803242A
	cmp r0, #0xb9
	bgt _08032448
	cmp r0, #0xb8
	blt _08032448
_0803242A:
	bl GetPartyGoldAmount
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetItemCost
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	b _08032456
	.align 2, 0
_08032440: .4byte 0x0203A954
_08032444: .4byte 0xFFFFEFFF
_08032448:
	ldr r0, _08032498 @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl UnitAddItem
_08032456:
	ldr r5, _08032498 @ =0x0203A954
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802CA5C
	ldr r4, _0803249C @ =0x0203A568
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_802A4F0
	adds r4, #0x48
	strh r6, [r4]
	adds r0, r7, #0
	bl sub_802CB70
	bl sub_807B4B8
	bl sub_807DA2C
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08032498: .4byte 0x0203A954
_0803249C: .4byte 0x0203A568

