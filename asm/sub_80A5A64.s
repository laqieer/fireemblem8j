	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set GetUnitsAverageSupportValue, 0x080A7EAC + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A5A64, "ax", %progbits
@ sub_80A5A64 @ JP 0x080A5A64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5A64
	.thumb_func
sub_80A5A64:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _080A5AF8 @ =0x081F5698
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sb
	adds r0, #0x3f
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A5B00
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _080A5AFC @ =0x02023CA8
	lsls r0, r0, #1
	adds r4, r0, r1
_080A5A9E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _080A5A9E
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _080A5AFC @ =0x02023CA8
	lsls r0, r0, #1
	adds r4, r0, r1
_080A5AC0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _080A5AC0
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _080A5AFC @ =0x02023CA8
	lsls r0, r0, #1
	adds r4, r0, r1
_080A5AE2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A5AE2
	b _080A5C40
	.align 2, 0
_080A5AF8: .4byte 0x081F5698
_080A5AFC: .4byte 0x02023CA8
_080A5B00:
	movs r7, #0
	mov r2, sb
	ldr r0, [r2, #0x2c]
	bl GetSupportScreenCharIdAt
	str r0, [sp, #0x14]
	mov r3, sb
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	str r0, [sp, #0x18]
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A5B20
	movs r7, #1
_080A5B20:
	mov r4, sb
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _080A5BB0 @ =0x088582BC
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8009FA8
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _080A5BB4 @ =0x02023CC8
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_8004374
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, sb
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl GetSupportScreenPartnerCharId
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _080A5BB0 @ =0x088582BC
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl GetUnitsAverageSupportValue
	cmp r0, #2
	bne _080A5BFC
	movs r5, #0
	mov r0, sb
	adds r0, #0x46
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov sb, r4
	lsls r4, r0, #1
_080A5BA2:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _080A5BB8
	movs r7, #4
	b _080A5BC0
	.align 2, 0
_080A5BB0: .4byte 0x088582BC
_080A5BB4: .4byte 0x02023CC8
_080A5BB8:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A5BC0
	movs r7, #0
_080A5BC0:
	ldr r3, _080A5BF8 @ =0x02023CA8
	adds r0, r4, r3
	mov r1, sb
	adds r1, #4
	mov sb, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _080A5BA2
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl PutSpecialChar
	b _080A5C40
	.align 2, 0
_080A5BF8: .4byte 0x02023CA8
_080A5BFC:
	movs r5, #0
	mov r0, sb
	adds r0, #0x46
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_080A5C10:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _080A5C1C
	movs r7, #4
	b _080A5C24
_080A5C1C:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A5C24
	movs r7, #0
_080A5C24:
	ldr r0, _080A5C50 @ =0x02023CA8
	adds r0, r4, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	bl PutSpecialChar
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A5C10
_080A5C40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5C50: .4byte 0x02023CA8

