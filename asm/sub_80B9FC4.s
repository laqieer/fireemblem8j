	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PlaySeDelayed, 0x08014BB0 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set sub_80B8E3C, 0x080B8E3C + 1
	.set sub_80B9A5C, 0x080B9A5C + 1
	.set sub_80B9B18, 0x080B9B18 + 1
	.set sub_80B9DA4, 0x080B9DA4 + 1
	.section .text.sub_80B9FC4, "ax", %progbits
@ sub_80B9FC4 @ JP 0x080B9FC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9FC4
	.thumb_func
sub_80B9FC4:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xb9
	movs r1, #8
	bl PlaySeDelayed
	ldr r1, _080BA014 @ =0x0203A954
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bl GetPartyGoldAmount
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	lsls r2, r2, #1
	subs r1, #0x2c
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_80B9DA4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	adds r0, r5, #0
	bl sub_80B8E3C
	adds r0, r5, #0
	bl sub_80B9B18
	ldr r0, _080BA018 @ =0x02022E5E
	bl sub_80B9A5C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA014: .4byte 0x0203A954
_080BA018: .4byte 0x02022E5E

