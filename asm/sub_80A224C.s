	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.section .text.sub_80A224C, "ax", %progbits
@ sub_80A224C @ JP 0x080A224C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A224C
	.thumb_func
sub_80A224C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080A22A4 @ =0x02022F10
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	cmp r4, #0
	beq _080A22BE
	adds r0, r4, #0
	bl sub_80B9DEC
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A227E
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A22A8
_080A227E:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _080A22B4
	.align 2, 0
_080A22A4: .4byte 0x02022F10
_080A22A8:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
_080A22B4:
	ldr r0, _080A22CC @ =0x02022F1E
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
_080A22BE:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A22CC: .4byte 0x02022F1E

