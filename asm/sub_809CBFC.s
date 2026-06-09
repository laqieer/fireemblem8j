	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.section .text.sub_809CBFC, "ax", %progbits
@ sub_809CBFC @ JP 0x0809CBFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CBFC
	.thumb_func
sub_809CBFC:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0809CCAC @ =0x02022D72
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	adds r0, r5, #0
	bl sub_8018FCC
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl sub_8005890
	ldr r0, _0809CCB0 @ =0x02013628
	mov r8, r0
	bl sub_8003CF8
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	movs r0, #0x38
	bl sub_8003EAC
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl sub_8004374
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CCAC: .4byte 0x02022D72
_0809CCB0: .4byte 0x02013628

