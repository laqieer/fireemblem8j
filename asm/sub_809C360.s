	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.section .text.sub_809C360, "ax", %progbits
@ sub_809C360 @ JP 0x0809C360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C360
	.thumb_func
sub_809C360:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r1, r0, #4
	ldrh r0, [r5, #0x34]
	subs r0, r4, r0
	cmp r0, #0x20
	ble _0809C39A
	cmp r4, r1
	bne _0809C394
	adds r0, r4, #0
	subs r0, #0x30
	b _0809C3AA
_0809C394:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809C3AA
_0809C39A:
	cmp r0, #0xf
	bgt _0809C3AC
	cmp r4, #0
	bne _0809C3A6
	strh r4, [r5, #0x34]
	b _0809C3AC
_0809C3A6:
	adds r0, r6, #0
	subs r0, #0x10
_0809C3AA:
	strh r0, [r5, #0x34]
_0809C3AC:
	ldr r1, _0809C3E4 @ =0x0000FFD8
	ldrh r2, [r5, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r4, [r5, #0x34]
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E4: .4byte 0x0000FFD8

