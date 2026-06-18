	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_800407C, 0x0800407C + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80A7F88, 0x080A7F88 + 1
	.section .text.sub_80A4DD0, "ax", %progbits
@ DrawSupportScreenText @ JP 0x080A4DD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawSupportScreenText
	.thumb_func
DrawSupportScreenText:
	push {r4, r5, r6, r7, lr}
	ldr r5, _080A4E84 @ =0x02013588
	bl sub_80A7F88
	adds r6, r0, #0
	adds r4, r5, #0
	subs r4, #8
	adds r0, r4, #0
	movs r1, #0xf
	bl InitText
	adds r0, r5, #0
	movs r1, #9
	bl InitText
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #0xa7
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	ldr r7, _080A4E88 @ =0x02023138
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	adds r0, r5, #0
	bl sub_8003CF8
	movs r4, #0
	cmp r6, #0x64
	bne _080A4E20
	movs r4, #4
_080A4E20:
	ldr r0, _080A4E8C @ =0x00000535
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_80043B8
	adds r0, r5, #0
	movs r1, #0x30
	bl sub_8003D84
	movs r1, #2
	cmp r6, #0x64
	bne _080A4E42
	movs r1, #4
_080A4E42:
	adds r0, r5, #0
	bl sub_8003D90
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_800407C
	movs r4, #0
	cmp r6, #0x64
	bne _080A4E58
	movs r4, #4
_080A4E58:
	movs r0, #0xe9
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x38
	adds r2, r4, #0
	bl sub_80043B8
	ldr r0, _080A4E90 @ =0xFFFFFC16
	adds r1, r7, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E84: .4byte 0x02013588
_080A4E88: .4byte 0x02023138
_080A4E8C: .4byte 0x00000535
_080A4E90: .4byte 0xFFFFFC16

