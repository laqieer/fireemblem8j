	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set IsSoundRoomSongPlayable, 0x080B390C + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8004C84, 0x08004C84 + 1
	.section .text.sub_80B3FE8, "ax", %progbits
@ sub_80B3FE8 @ JP 0x080B3FE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3FE8
	.thumb_func
sub_80B3FE8:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	lsrs r0, r0, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080B4004 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	adds r4, r7, #0
	adds r0, r4, #0
	b _080B40C8
	.align 2, 0
_080B4004: .4byte 0x02023CA8
_080B4008:
	adds r0, r6, #0
	adds r1, r4, #0
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B401A
	movs r5, #0
	b _080B4060
_080B401A:
	ldr r0, _080B4058 @ =0x08A9DDDC
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4060
	adds r2, r4, #0
	cmp r4, #0
	bge _080B4030
	adds r2, r4, #3
_080B4030:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080B405C @ =0x02023CA8
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080B40C4
	.align 2, 0
_080B4058: .4byte 0x08A9DDDC
_080B405C: .4byte 0x02023CA8
_080B4060:
	cmp r4, #0x62
	ble _080B4098
	adds r2, r4, #0
	cmp r4, #0
	bge _080B406C
	adds r2, r4, #3
_080B406C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080B4094 @ =0x02023CA8
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl PutNumber
	b _080B40C4
	.align 2, 0
_080B4094: .4byte 0x02023CA8
_080B4098:
	adds r2, r4, #0
	cmp r4, #0
	bge _080B40A0
	adds r2, r4, #3
_080B40A0:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080B40EC @ =0x02023CA8
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_8004C84
_080B40C4:
	adds r4, #1
	adds r0, r7, #0
_080B40C8:
	adds r0, #0x1c
	cmp r4, r0
	bge _080B40DE
	movs r5, #1
	cmp r4, #0
	blt _080B40C4
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080B4008
_080B40DE:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B40EC: .4byte 0x02023CA8

