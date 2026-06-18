	.syntax unified
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set PrepItem_DrawUnitNameRow, 0x0809C3E8 + 1
	.set sub_80B1F84, 0x080B1F84 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809B118, "ax", %progbits
@ PrepItemScreen_DpadKeyHandler @ JP 0x0809B118 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemScreen_DpadKeyHandler
	.thumb_func
PrepItemScreen_DpadKeyHandler:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r3, r8
	adds r3, #0x2a
	ldrb r7, [r3]
	ldr r0, _0809B1F4 @ =0x085775CC
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	mov r4, r8
	adds r4, #0x31
	movs r0, #4
	strb r0, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B146
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r4]
_0809B146:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _0809B158
	ldrb r0, [r3]
	subs r0, #3
	cmp r0, #0
	blt _0809B158
	strb r0, [r3]
_0809B158:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x2a
	cmp r0, #0
	beq _0809B176
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809B176
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_0809B176:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0809B192
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B192
	subs r0, r4, #1
	strb r0, [r6]
_0809B192:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _0809B1BC
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809B1BC
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809B1BC
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_0809B1BC:
	ldrb r0, [r6]
	cmp r0, r7
	beq _0809B278
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x34]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _0809B1F8
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809B1F8
	lsrs r1, r1, #4
	adds r1, #4
	b _0809B20C
	.align 2, 0
_0809B1F4: .4byte 0x085775CC
_0809B1F8:
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _0809B22C
	cmp r7, #0
	beq _0809B22C
	lsrs r1, r7, #4
	subs r1, #1
_0809B20C:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl PrepItem_DrawUnitNameRow
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl sub_80B1F84
	b _0809B25C
_0809B22C:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80B1FBC
_0809B25C:
	ldr r0, _0809B274 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B26E
	movs r0, #0x65
	bl m4aSongNumStart
_0809B26E:
	movs r0, #1
	b _0809B27A
	.align 2, 0
_0809B274: .4byte 0x0202BCEC
_0809B278:
	movs r0, #0
_0809B27A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

