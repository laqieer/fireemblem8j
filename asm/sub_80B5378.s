	.syntax unified
	.set LoadBonusContentData, 0x080A8338 + 1
	.set SaveBonusContentData, 0x080A8394 + 1
	.set sub_80A976C, 0x080A976C + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80B5378, "ax", %progbits
@ sub_80B5378 @ JP 0x080B5378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5378
	.thumb_func
sub_80B5378:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	mov sb, r0
	mov r0, sp
	mov r1, sb
	strh r1, [r0]
	ldr r0, _080B53E8 @ =0x08A9E500
	ldr r1, [r0]
	ldr r2, _080B53EC @ =0x01000040
	mov r0, sp
	bl sub_80D6370
	mov r0, sp
	adds r0, #2
	mov r3, sb
	strh r3, [r0]
	ldr r4, _080B53F0 @ =0x08A9E4F8
	ldr r1, [r4]
	ldr r2, _080B53F4 @ =0x010000A2
	bl sub_80D6370
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080B5486
	ldr r0, [r4]
	ldr r1, _080B53F8 @ =0x08A9E4FC
	ldr r1, [r1]
	movs r2, #0x51
	bl sub_80D636C
	movs r0, #0
	mov r8, r0
	movs r7, #0
_080B53C6:
	ldr r2, _080B53F0 @ =0x08A9E4F8
	ldr r0, [r2]
	adds r3, r0, r7
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B546A
	ldrb r1, [r3, #1]
	cmp r1, #1
	beq _080B5402
	cmp r1, #1
	bgt _080B53FC
	cmp r1, #0
	beq _080B540E
	b _080B544C
	.align 2, 0
_080B53E8: .4byte 0x08A9E500
_080B53EC: .4byte 0x01000040
_080B53F0: .4byte 0x08A9E4F8
_080B53F4: .4byte 0x010000A2
_080B53F8: .4byte 0x08A9E4FC
_080B53FC:
	cmp r1, #2
	beq _080B540E
	b _080B544C
_080B5402:
	ldr r0, _080B5438 @ =0x0202BCEC
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080B546A
_080B540E:
	ldr r5, _080B543C @ =0x08A9E500
	ldr r0, [r5]
	mov r1, sb
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	mov r3, r8
	strb r3, [r0]
	bl sub_80A976C
	movs r2, #1
	adds r1, r2, #0
	mov r3, r8
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080B5440
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080B5446
	.align 2, 0
_080B5438: .4byte 0x0202BCEC
_080B543C: .4byte 0x08A9E500
_080B5440:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080B5446:
	movs r0, #1
	add sb, r0
	ldr r2, _080B5490 @ =0x08A9E4F8
_080B544C:
	ldr r0, [r2]
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _080B546A
	ldr r0, _080B5494 @ =0x08A9E4FC
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #0xfc
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
_080B546A:
	adds r7, #0x14
	movs r1, #1
	add r8, r1
	mov r3, r8
	cmp r3, #0xf
	ble _080B53C6
	ldr r0, _080B5498 @ =0x08A9E504
	ldr r0, [r0]
	mov r1, sb
	str r1, [r0]
	ldr r0, _080B5494 @ =0x08A9E4FC
	ldr r0, [r0]
	bl SaveBonusContentData
_080B5486:
	mov r3, sb
	cmp r3, #0
	beq _080B549C
	movs r0, #1
	b _080B549E
	.align 2, 0
_080B5490: .4byte 0x08A9E4F8
_080B5494: .4byte 0x08A9E4FC
_080B5498: .4byte 0x08A9E504
_080B549C:
	movs r0, #0
_080B549E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

