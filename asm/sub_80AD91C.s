	.syntax unified
	.set SaveMenuGetBitfile, 0x080AD25C + 1
	.set SaveMenuGetValidMenuAmt, 0x080B09F8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B0354, 0x080B0354 + 1
	.section .text.sub_80AD91C, "ax", %progbits
@ sub_80AD91C @ JP 0x080AD91C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD91C
	.thumb_func
sub_80AD91C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080AD94C @ =0x08AA59A0
	ldr r1, _080AD950 @ =0x06014000
	bl sub_8013008
	adds r0, r5, #0
	bl sub_80B0354
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080AD954
	movs r0, #0x20
	adds r1, r5, #0
	bl SaveMenuGetValidMenuAmt
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080AD982
	.align 2, 0
_080AD94C: .4byte 0x08AA59A0
_080AD950: .4byte 0x06014000
_080AD954:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl SaveMenuGetBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080AD982:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080AD990
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080AD990:
	ldrb r0, [r4]
	cmp r0, #5
	bne _080AD99E
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080AD99E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

