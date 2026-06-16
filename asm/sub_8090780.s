	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set InitTextInitInfo, 0x08003CDC + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80901A4, 0x080901A4 + 1
	.set sub_8090474, 0x08090474 + 1
	.set sub_80906C8, 0x080906C8 + 1
	.set sub_8090710, 0x08090710 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8090780, "ax", %progbits
@ ChapterStatus_DrawText @ JP 0x08090780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ChapterStatus_DrawText
	.thumb_func
ChapterStatus_DrawText:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080907D8 @ =0x08A73BF4
	bl InitTextInitInfo
	adds r0, r6, #0
	bl sub_80906C8
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #6
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8090474
	ldr r4, _080907DC @ =0x020235F0
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _080907E0 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080907E4
	adds r0, r4, #0
	adds r0, #0xe
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _080907F4
	.align 2, 0
_080907D8: .4byte 0x08A73BF4
_080907DC: .4byte 0x020235F0
_080907E0: .4byte 0x0202BCEC
_080907E4:
	adds r0, r4, #0
	adds r0, #0xe
	adds r1, r6, #0
	adds r1, #0x31
	ldrb r2, [r1]
	movs r1, #2
	bl PutNumber
_080907F4:
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	bl sub_80C1E74
	mov r8, r4
	cmp r0, #2
	beq _0809081C
	ldr r0, _08090818 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x88
	ldrh r0, [r0]
	b _08090820
	.align 2, 0
_08090818: .4byte 0x0202BCEC
_0809081C:
	movs r0, #0xa5
	lsls r0, r0, #1
_08090820:
	bl sub_8009FA8
	adds r5, r0, #0
	ldr r7, _08090888 @ =0x02004BAC
	movs r0, #0x60
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r7, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_80901A4
	adds r5, r0, #0
	cmp r5, #0
	beq _08090866
	adds r4, r7, #0
	adds r4, #8
	movs r0, #0x60
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_80043B8
	movs r0, #2
	mov r1, r8
	strb r0, [r1]
_08090866:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #2
	bne _08090890
	ldr r4, _0809088C @ =0x02022F2A
	adds r0, r7, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r7, #0
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl PutText
	b _08090898
	.align 2, 0
_08090888: .4byte 0x02004BAC
_0809088C: .4byte 0x02022F2A
_08090890:
	ldr r1, _080908D0 @ =0x02022F6A
	adds r0, r7, #0
	bl PutText
_08090898:
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	cmp r0, #0
	beq _080908BA
	ldr r0, _080908D4 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080908BA
	ldr r0, _080908D8 @ =0x02022CDC
	ldrb r2, [r4]
	adds r2, #1
	movs r1, #0
	bl PutNumberOrBlank
_080908BA:
	bl sub_8090710
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080908D0: .4byte 0x02022F6A
_080908D4: .4byte 0x0202BCEC
_080908D8: .4byte 0x02022CDC

