	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A0ED8, "ax", %progbits
@ PrepItemList_DrawCurrentOwnerText @ JP 0x080A0ED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemList_DrawCurrentOwnerText
	.thumb_func
PrepItemList_DrawCurrentOwnerText:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _080A0F24 @ =0x02022D18
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r7, _080A0F28 @ =0x02013660
	adds r0, r7, #0
	bl sub_8003CF8
	ldr r0, _080A0F2C @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, r4
	bgt _080A0F34
	ldr r0, _080A0F30 @ =0x000004C6
	bl sub_8009FA8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _080A0F58
	.align 2, 0
_080A0F24: .4byte 0x02022D18
_080A0F28: .4byte 0x02013660
_080A0F2C: .4byte 0x02012F56
_080A0F30: .4byte 0x000004C6
_080A0F34:
	ldr r0, _080A0F60 @ =0x020122D4
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _080A0F68
	ldr r0, _080A0F64 @ =0x00000523
	bl sub_8009FA8
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_080A0F58:
	movs r3, #0
	bl sub_8004374
	b _080A0F88
	.align 2, 0
_080A0F60: .4byte 0x020122D4
_080A0F64: .4byte 0x00000523
_080A0F68:
	adds r0, r4, #0
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl sub_8004374
_080A0F88:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

