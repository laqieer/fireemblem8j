	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_809A674, 0x0809A674 + 1
	.section .text.sub_809B600, "ax", %progbits
@ PrepItem_DrawCommandMenuText @ JP 0x0809B600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItem_DrawCommandMenuText
	.thumb_func
PrepItem_DrawCommandMenuText:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	mov sl, r2
	mov r0, r8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r7, _0809B72C @ =0x02013560
	adds r0, r7, #0
	bl sub_8003CF8
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _0809B630
	movs r4, #1
_0809B630:
	ldr r0, _0809B730 @ =0x0000051F
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_80043B8
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _0809B64E
	movs r4, #1
_0809B64E:
	movs r0, #0xa4
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0x24
	adds r2, r4, #0
	bl sub_80043B8
	mov r1, r8
	adds r1, #0x40
	adds r0, r7, #0
	bl PutText
	adds r5, r7, #0
	adds r5, #8
	adds r0, r5, #0
	bl sub_8003CF8
	mov r0, sl
	bl sub_809A674
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809B686
	movs r4, #1
_0809B686:
	ldr r0, _0809B734 @ =0x00000521
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_80043B8
	movs r6, #0
	mov r4, sb
	adds r4, #0x2c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809B6A8
	movs r6, #1
_0809B6A8:
	ldr r0, _0809B738 @ =0x00000525
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x24
	adds r2, r6, #0
	bl sub_80043B8
	mov r1, r8
	adds r1, #0xc0
	adds r0, r5, #0
	bl PutText
	adds r5, r7, #0
	adds r5, #0x10
	adds r0, r5, #0
	bl sub_8003CF8
	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809B6DA
	movs r6, #1
_0809B6DA:
	ldr r0, _0809B73C @ =0x00000523
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_80043B8
	ldr r0, _0809B740 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B748
	adds r6, r5, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0809B716
	mov r0, sl
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809B716
	bl CheckInLinkArena
	cmp r0, #0
	beq _0809B718
_0809B716:
	movs r5, #1
_0809B718:
	ldr r0, _0809B744 @ =0x00000522
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x24
	adds r2, r5, #0
	bl sub_80043B8
	b _0809B77A
	.align 2, 0
_0809B72C: .4byte 0x02013560
_0809B730: .4byte 0x0000051F
_0809B734: .4byte 0x00000521
_0809B738: .4byte 0x00000525
_0809B73C: .4byte 0x00000523
_0809B740: .4byte 0x03005270
_0809B744: .4byte 0x00000522
_0809B748:
	bl CheckInLinkArena
	cmp r0, #0
	beq _0809B768
	ldr r0, _0809B764 @ =0x00000524
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x24
	movs r2, #1
	bl sub_80043B8
	b _0809B77A
	.align 2, 0
_0809B764: .4byte 0x00000524
_0809B768:
	ldr r0, _0809B794 @ =0x00000524
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x24
	movs r2, #0
	bl sub_80043B8
_0809B77A:
	ldr r0, _0809B798 @ =0x02013570
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	bl PutText
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B794: .4byte 0x00000524
_0809B798: .4byte 0x02013570

