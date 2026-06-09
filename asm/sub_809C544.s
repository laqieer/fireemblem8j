	.syntax unified
	.set GetGMapBaseMenuKind, 0x080C8E28 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set IsCoordHiddenByMinimug, 0x0809C4EC + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027AF4, 0x08027AF4 + 1
	.set sub_809C500, 0x0809C500 + 1
	.section .text.sub_809C544, "ax", %progbits
@ sub_809C544 @ JP 0x0809C544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C544
	.thumb_func
sub_809C544:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _0809C5D8
_0809C54C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x34]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _0809C5D6
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809C588
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsCoordHiddenByMinimug
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C5D6
_0809C588:
	ldr r0, _0809C5B8 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C5BC
	bl GetGMapBaseMenuKind
	cmp r0, #2
	bne _0809C5BC
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #4
	movs r3, #0xff
	ands r2, r3
	bl sub_809C500
	b _0809C5D6
	.align 2, 0
_0809C5B8: .4byte 0x03005270
_0809C5BC:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8027AF4
_0809C5D6:
	adds r6, #1
_0809C5D8:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809C54C
	bl sub_8026ED0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

