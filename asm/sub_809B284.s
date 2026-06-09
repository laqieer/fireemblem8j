	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.section .text.sub_809B284, "ax", %progbits
@ sub_809B284 @ JP 0x0809B284 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B284
	.thumb_func
sub_809B284:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809B324
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809B324
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	adds r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _0809B3A8 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809B304
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80B1474
_0809B304:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_0809B324:
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0xf
	bgt _0809B3A0
	cmp r1, #0
	beq _0809B3A0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	subs r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _0809B3A8 @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809B380
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80B1474
_0809B380:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
_0809B3A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B3A8: .4byte 0x0000FFD8

