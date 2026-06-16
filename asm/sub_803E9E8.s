	.syntax unified
	.set AiIsWithinFlyingDistance, 0x0803EBE4 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_803EC28, 0x0803EC28 + 1
	.section .text.sub_803E9E8, "ax", %progbits
@ AiEquipGetDanger @ JP 0x0803E9E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiEquipGetDanger
	.thumb_func
AiEquipGetDanger:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x38]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _0803EB24 @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r4, #1
_0803EA16:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _0803EB00
	ldr r0, [r5]
	cmp r0, #0
	beq _0803EB00
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _0803EB00
	ldr r0, _0803EB28 @ =0x0202BE40
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EB00
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl AiIsWithinFlyingDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EB00
	adds r0, r5, #0
	bl sub_801A05C
	ldr r4, _0803EB2C @ =0x0202E4DC
	ldr r1, [r4]
	ldr r2, [sp, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [sp, #4]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803EB00
	adds r0, r5, #0
	mov r1, sp
	bl sub_803EC28
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble _0803EA92
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, r0, r6
	strh r0, [r1]
_0803EA92:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803EAA6
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	adds r0, r0, r6
	strh r0, [r2]
_0803EAA6:
	ldr r1, _0803EB30 @ =0x0202E4D0
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _0803EB00
	mov sb, r4
	ldr r0, _0803EB24 @ =0x0202E4EC
	mov r8, r0
_0803EABA:
	mov r1, sl
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r3, r0, #1
	subs r7, r2, #1
	cmp r3, #0
	blt _0803EAFA
	lsls r4, r2, #2
	mov r1, sb
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_0803EAD2:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803EAF4
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r2, r0, r3
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0xff
	ble _0803EAF2
	mov r0, ip
_0803EAF2:
	strb r0, [r2]
_0803EAF4:
	subs r3, #1
	cmp r3, #0
	bge _0803EAD2
_0803EAFA:
	adds r2, r7, #0
	cmp r2, #0
	bge _0803EABA
_0803EB00:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _0803EA16
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r3, [sp, #0x38]
	strh r0, [r3]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EB24: .4byte 0x0202E4EC
_0803EB28: .4byte 0x0202BE40
_0803EB2C: .4byte 0x0202E4DC
_0803EB30: .4byte 0x0202E4D0

