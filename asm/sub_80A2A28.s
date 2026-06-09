	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A2A28, "ax", %progbits
@ sub_80A2A28 @ JP 0x080A2A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2A28
	.thumb_func
sub_80A2A28:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r6, _080A2AE8 @ =0x02013498
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldr r0, _080A2AEC @ =0x02022F28
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl j_TmFillRect
	movs r4, #0
_080A2A50:
	adds r0, r6, #0
	bl sub_8003CF8
	ldr r1, _080A2AF0 @ =0x08A95424
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _080A2AF4 @ =0x02022CA8
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, sb
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2A9A
	movs r2, #1
_080A2A9A:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_8004374
	adds r4, #1
	cmp r4, #3
	ble _080A2A50
	ldr r0, _080A2AE8 @ =0x02013498
	adds r6, r0, #0
	adds r6, #0xe8
	adds r0, r6, #0
	bl sub_8003CF8
	ldr r0, _080A2AF8 @ =0x08A95410
	ldr r0, [r0, #0xc]
	bl sub_8009FA8
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2AE8: .4byte 0x02013498
_080A2AEC: .4byte 0x02022F28
_080A2AF0: .4byte 0x08A95424
_080A2AF4: .4byte 0x02022CA8
_080A2AF8: .4byte 0x08A95410

