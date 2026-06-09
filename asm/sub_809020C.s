	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8033168, 0x08033168 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808FFE0, 0x0808FFE0 + 1
	.set sub_80900A8, 0x080900A8 + 1
	.set sub_80900E0, 0x080900E0 + 1
	.section .text.sub_809020C, "ax", %progbits
@ sub_809020C @ JP 0x0809020C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809020C
	.thumb_func
sub_809020C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0
	bl sub_8001ACC
	ldr r4, _0809033C @ =0x03003020
	ldrb r0, [r4, #0xc]
	mov sb, r0
	movs r5, #4
	rsbs r5, r5, #0
	ldrb r0, [r4, #0x10]
	adds r2, r5, #0
	ands r2, r0
	movs r6, #1
	mov r8, r6
	mov r0, r8
	orrs r2, r0
	ldrb r0, [r4, #0x14]
	adds r1, r5, #0
	ands r1, r0
	movs r6, #2
	mov ip, r6
	mov r0, ip
	orrs r1, r0
	ldrb r3, [r4, #0x18]
	movs r0, #3
	orrs r3, r0
	adds r0, r5, #0
	mov r6, sb
	ands r0, r6
	strb r0, [r4, #0xc]
	ands r2, r5
	mov r0, r8
	orrs r2, r0
	strb r2, [r4, #0x10]
	ands r1, r5
	mov r6, ip
	orrs r1, r6
	strb r1, [r4, #0x14]
	ands r3, r5
	orrs r3, r6
	strb r3, [r4, #0x18]
	bl ResetText
	bl sub_804F8F4
	movs r5, #0
	movs r0, #0
	strh r0, [r7, #0x3c]
	adds r0, r7, #0
	adds r0, #0x3e
	strb r5, [r0]
	subs r0, #0x14
	strb r5, [r0]
	ldr r4, _08090340 @ =0x0000FFFE
	ldr r2, _08090344 @ =0x0000FFFC
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldr r2, _08090348 @ =0x0000FFDC
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_804F610
	ldr r0, _0809034C @ =0x085E0D94
	movs r1, #0x40
	movs r2, #0x60
	bl sub_8000D68
	ldr r0, _08090350 @ =0x08AAF350
	ldr r1, _08090354 @ =0x06005800
	bl sub_8013008
	ldr r0, _08090358 @ =0x02023CA8
	ldr r1, _0809035C @ =0x08AAEE9C
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _08090360 @ =0x08AADC58
	ldr r1, _08090364 @ =0x06013000
	bl sub_8013008
	ldr r0, _08090368 @ =0x08AAEAE4
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _0809036C @ =0x08AAEB24
	ldr r1, _08090370 @ =0x06013300
	bl sub_8013008
	bl SetDefaultColorEffects
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #0x12
	strb r5, [r0]
	bl sub_8033168
	bl GetUnitFromCharId
	str r0, [r7, #0x34]
	movs r0, #0
	bl sub_80900E0
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	bl GetGlobalCompletionCount
	adds r1, r7, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldr r2, [r7, #0x34]
	ldr r1, [r2, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08090374
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b _0809037A
	.align 2, 0
_0809033C: .4byte 0x03003020
_08090340: .4byte 0x0000FFFE
_08090344: .4byte 0x0000FFFC
_08090348: .4byte 0x0000FFDC
_0809034C: .4byte 0x085E0D94
_08090350: .4byte 0x08AAF350
_08090354: .4byte 0x06005800
_08090358: .4byte 0x02023CA8
_0809035C: .4byte 0x08AAEE9C
_08090360: .4byte 0x08AADC58
_08090364: .4byte 0x06013000
_08090368: .4byte 0x08AAEAE4
_0809036C: .4byte 0x08AAEB24
_08090370: .4byte 0x06013300
_08090374:
	adds r0, r7, #0
	adds r0, #0x29
	strb r5, [r0]
_0809037A:
	bl sub_80900A8
	cmp r0, #0
	beq _08090386
	bl sub_808FFE0
_08090386:
	str r0, [r7, #0x38]
	movs r0, #0x80
	bl sub_80900E0
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_80265CC
	adds r4, r7, #0
	adds r4, #0x34
	movs r5, #1
_0809039E:
	ldr r0, [r4]
	cmp r0, #0
	beq _080903AC
	bl sub_80176AC
	bl sub_80267A0
_080903AC:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0809039E
	bl sub_8026F38
	ldr r6, _08090468 @ =0x03003020
	ldrb r0, [r6, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x48
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r3, #2
	ldrb r0, [r3]
	orrs r0, r5
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xe
	bl StartMuralBackground
	ldr r0, _0809046C @ =0x08BB059C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	movs r0, #0xc8
	movs r1, #0x12
	movs r2, #2
	adds r3, r7, #0
	bl sub_808B750
	ldr r0, _08090470 @ =0x08A73D5C
	adds r1, r7, #0
	bl sub_8002BCC
	ldrb r1, [r6, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	ands r0, r5
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090468: .4byte 0x03003020
_0809046C: .4byte 0x08BB059C
_08090470: .4byte 0x08A73D5C

