	.syntax unified
	.set DrawArenaOpponentDetailsText, 0x080BA7CC + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8031E18, 0x08031E18 + 1
	.set sub_80B9A5C, 0x080B9A5C + 1
	.section .text.sub_80BA5BC, "ax", %progbits
@ sub_80BA5BC @ JP 0x080BA5BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA5BC
	.thumb_func
sub_80BA5BC:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPartyGoldAmount
	adds r4, r0, #0
	bl sub_8031E18
	subs r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	ldr r0, _080BA5F8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BA5E4
	movs r0, #0xb9
	bl m4aSongNumStart
_080BA5E4:
	ldr r0, _080BA5FC @ =0x02022E5E
	bl sub_80B9A5C
	adds r0, r5, #0
	bl DrawArenaOpponentDetailsText
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5F8: .4byte 0x0202BCEC
_080BA5FC: .4byte 0x02022E5E

