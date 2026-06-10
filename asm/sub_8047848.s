	.syntax unified
	.set LoadLinkArenaRuleSettings, 0x08047590 + 1
	.set SaveLinkArenaRuleSettings, 0x080475B0 + 1
	.set SioRuleSettings_DrawRuleOptions, 0x080475F0 + 1
	.set UpdateRuleSettingSprites, 0x0804DC5C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_80AB41C, 0x080AB41C + 1
	.section .text.sub_8047848, "ax", %progbits
@ sub_8047848 @ JP 0x08047848 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047848
	.thumb_func
sub_8047848:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, _08047964 @ =0x085775CC
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08047872
	movs r0, #1
	bl sub_8043190
	ldr r0, _08047968 @ =0x0203DB0C
	bl sub_80AB41C
	adds r0, r6, #0
	bl sub_8002DE4
_08047872:
	mov r0, sp
	bl LoadLinkArenaRuleSettings
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08047890
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq _08047890
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
_08047890:
	ldr r2, _08047964 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _080478B0
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt _080478B0
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080478B0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080478D8
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl SioRuleSettings_DrawRuleOptions
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080478D8:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047900
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl SioRuleSettings_DrawRuleOptions
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08047900:
	mov r0, sp
	bl SaveLinkArenaRuleSettings
	cmp r4, #0
	beq _0804795C
	movs r0, #3
	bl sub_8043190
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne _0804791A
	movs r7, #2
	rsbs r7, r7, #0
_0804791A:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, _0804796C @ =0x080DEE28
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	ldr r0, [r6, #0x30]
	movs r1, #0xda
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	bl sub_8043084
_0804795C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047964: .4byte 0x085775CC
_08047968: .4byte 0x0203DB0C
_0804796C: .4byte 0x080DEE28

