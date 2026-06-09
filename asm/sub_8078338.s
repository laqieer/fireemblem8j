	.syntax unified
	.set DidBattleUnitBreakWeapon, 0x0802CDD4 + 1
	.set sub_800223C, 0x0800223C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_802C0F8, 0x0802C0F8 + 1
	.set sub_8077F70, 0x08077F70 + 1
	.section .text.sub_8078338, "ax", %progbits
@ sub_8078338 @ JP 0x08078338 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078338
	.thumb_func
sub_8078338:
	push {r4, r5, lr}
	ldr r0, _0807838C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _080783BE
	ldr r4, _08078390 @ =0x02020140
	ldr r0, _08078394 @ =0x087E1AE0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08078398 @ =0x02020144
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	str r0, [r5, #0x48]
	movs r2, #0
	ldr r4, _0807839C @ =0x0203E188
	ldr r3, _080783A0 @ =0x0203E184
_08078364:
	ldr r0, [r4]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080783A6
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080783A6
	ldr r1, [r5, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080783A4
	str r2, [r5, #0x44]
	b _080783A6
	.align 2, 0
_0807838C: .4byte 0x0203E11C
_08078390: .4byte 0x02020140
_08078394: .4byte 0x087E1AE0
_08078398: .4byte 0x02020144
_0807839C: .4byte 0x0203E188
_080783A0: .4byte 0x0203E184
_080783A4:
	str r2, [r5, #0x48]
_080783A6:
	adds r2, #1
	cmp r2, #7
	ble _08078364
	ldr r1, [r5, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807845C
	movs r0, #0x80
	bl sub_800223C
	b _08078486
_080783BE:
	ldr r4, _08078468 @ =0x02020140
	ldr r0, _0807846C @ =0x087E1A78
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08078470 @ =0x02020144
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _08078474 @ =0x0203E110
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08078414
	ldr r4, _08078478 @ =0x0203E184
	ldr r0, [r4]
	bl sub_802C0F8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080783FE
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_080783FE:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08078414
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_08078414:
	ldr r0, _08078474 @ =0x0203E110
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807844C
	ldr r4, _0807847C @ =0x0203E188
	ldr r0, [r4]
	bl sub_802C0F8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08078436
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_08078436:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807844C
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0807844C:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _08078480
_0807845C:
	ldr r1, _08078470 @ =0x02020144
	movs r0, #1
	str r0, [r1]
	bl sub_8077F70
	b _08078486
	.align 2, 0
_08078468: .4byte 0x02020140
_0807846C: .4byte 0x087E1A78
_08078470: .4byte 0x02020144
_08078474: .4byte 0x0203E110
_08078478: .4byte 0x0203E184
_0807847C: .4byte 0x0203E188
_08078480:
	movs r0, #0x80
	bl sub_800223C
_08078486:
	pop {r4, r5}
	pop {r0}
	bx r0

