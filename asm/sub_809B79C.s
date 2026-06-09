	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_809A848, 0x0809A848 + 1
	.set sub_809C250, 0x0809C250 + 1
	.section .text.sub_809B79C, "ax", %progbits
@ sub_809B79C @ JP 0x0809B79C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B79C
	.thumb_func
sub_809B79C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2b
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r6, r0, #0
	adds r4, #0x32
	movs r1, #0
	mov r8, r1
	movs r0, #1
	strb r0, [r4]
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldr r5, _0809B890 @ =0x02013510
	ldr r7, _0809B894 @ =0x02022EEC
	mov r2, sb
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl sub_809C250
	ldr r0, _0809B898 @ =0x08A98350
	ldr r4, _0809B89C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0809B8A0 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #0
	movs r1, #0x1f
	bl sub_809A848
	adds r0, r6, #0
	bl sub_8018FCC
	ldr r3, _0809B8A4 @ =0xFFFFFEC0
	adds r1, r7, r3
	movs r2, #0x9c
	lsls r2, r2, #2
	mov r3, r8
	str r3, [sp]
	movs r3, #3
	bl sub_8005890
	adds r5, #0x78
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r0, [r6]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl sub_8003EAC
	adds r3, r0, #0
	ldr r0, _0809B8A8 @ =0xFFFFFECC
	adds r1, r7, r0
	mov r2, r8
	str r2, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl sub_8004374
	adds r0, r7, #0
	subs r0, #0xb6
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r7, #0
	subs r0, #0xae
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r7, #0
	subs r0, #0xb0
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r0, r7, #0
	subs r0, #0xaa
	ldrb r2, [r6, #9]
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B890: .4byte 0x02013510
_0809B894: .4byte 0x02022EEC
_0809B898: .4byte 0x08A98350
_0809B89C: .4byte 0x02020188
_0809B8A0: .4byte 0x020234A8
_0809B8A4: .4byte 0xFFFFFEC0
_0809B8A8: .4byte 0xFFFFFECC

