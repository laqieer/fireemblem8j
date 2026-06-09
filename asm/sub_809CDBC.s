	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809CDBC, "ax", %progbits
@ sub_809CDBC @ JP 0x0809CDBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CDBC
	.thumb_func
sub_809CDBC:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _0809CE00
	ldr r4, _0809CE88 @ =0x02013638
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _0809CE8C @ =0x0000052C
	bl sub_8009FA8
	ldr r5, _0809CE90 @ =0x02022D04
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809CE94 @ =0x0000052D
	bl sub_8009FA8
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl sub_8004374
_0809CE00:
	ldr r4, _0809CE98 @ =0x02022D08
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	adds r3, r4, #2
	adds r5, r7, #0
	adds r5, #0x29
	adds r6, r7, #0
	adds r6, #0x2a
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809CE24
	movs r1, #1
_0809CE24:
	ldrb r2, [r6]
	ldrb r0, [r5]
	subs r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	adds r3, r4, #0
	adds r3, #0x12
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809CE4E
	movs r1, #4
_0809CE4E:
	ldrb r2, [r5]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r3, r4, #0
	adds r3, #0x18
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809CE72
	movs r1, #4
_0809CE72:
	ldrb r2, [r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE88: .4byte 0x02013638
_0809CE8C: .4byte 0x0000052C
_0809CE90: .4byte 0x02022D04
_0809CE94: .4byte 0x0000052D
_0809CE98: .4byte 0x02022D08

