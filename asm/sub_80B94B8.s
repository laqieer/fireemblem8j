	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PlaySeDelayed, 0x08014BB0 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set sub_80088FC, 0x080088FC + 1
	.set sub_801915C, 0x0801915C + 1
	.set sub_80B8E3C, 0x080B8E3C + 1
	.set sub_80B9A5C, 0x080B9A5C + 1
	.set sub_80B9BE4, 0x080B9BE4 + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.section .text.sub_80B94B8, "ax", %progbits
@ sub_80B94B8 @ JP 0x080B94B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B94B8
	.thumb_func
sub_80B94B8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_80088FC
	cmp r0, #1
	bne _080B9530
	movs r0, #0xb9
	movs r1, #8
	bl PlaySeDelayed
	ldr r1, _080B9528 @ =0x0203A954
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bl GetPartyGoldAmount
	adds r4, r0, #0
	ldr r1, [r6, #0x2c]
	adds r5, r6, #0
	adds r5, #0x5c
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B9DEC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	ldr r0, [r6, #0x2c]
	ldrb r1, [r5]
	bl sub_801915C
	adds r0, r6, #0
	bl sub_80B8E3C
	adds r0, r6, #0
	bl sub_80B9BE4
	ldr r0, _080B952C @ =0x02022E5E
	bl sub_80B9A5C
	adds r0, r6, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B9538
	adds r0, r6, #0
	movs r1, #7
	bl Proc_Goto
	b _080B9538
	.align 2, 0
_080B9528: .4byte 0x0203A954
_080B952C: .4byte 0x02022E5E
_080B9530:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_080B9538:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

