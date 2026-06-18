	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set sub_80944C4, 0x080944C4 + 1
	.section .text.sub_8094590, "ax", %progbits
@ UnitList_DrawPageHeader @ JP 0x08094590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitList_DrawPageHeader
	.thumb_func
UnitList_DrawPageHeader:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r7, r3, #0
	lsls r2, r2, #0x18
	asrs r5, r2, #0x18
	cmp r3, #0
	beq _080945C6
	ldr r4, _080945E0 @ =0x02023D9C
	adds r0, r4, #0
	movs r1, #2
	adds r2, r3, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
_080945C6:
	cmp r5, #0
	beq _080945D2
	ldr r0, _080945E4 @ =0x02023DE8
	adds r1, r7, #0
	bl sub_80944C4
_080945D2:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080945E0: .4byte 0x02023D9C
_080945E4: .4byte 0x02023DE8

