	.syntax unified
	.set ClearTraps, 0x0802E100 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetUnit, 0x08019108 + 1
	.set InitBmBgLayers, 0x08015624 + 1
	.set NextRN_100, 0x08000C3C + 1
	.set ResetMenuOverrides, 0x0805046C + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_8018BCC, 0x08018BCC + 1
	.set sub_8019194, 0x08019194 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_802E2E0, 0x0802E2E0 + 1
	.set sub_8030D24, 0x08030D24 + 1
	.set sub_8031108, 0x08031108 + 1
	.set sub_80379A8, 0x080379A8 + 1
	.set sub_8085F70, 0x08085F70 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8030D50, "ax", %progbits
@ sub_8030D50 @ JP 0x08030D50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030D50
	.thumb_func
sub_8030D50:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl sub_8001ACC
	ldr r0, _08030DB0 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _08030DB4 @ =sub_80152C8
	bl sub_8001208
	bl sub_8030D24
	bl sub_80156F0
	bl sub_80265CC
	bl sub_8085F70
	bl ResetUnitSprites
	bl ResetMenuOverrides
	bl ClearTraps
	ldr r4, _08030DB8 @ =0x0202BCEC
	movs r1, #0
	movs r0, #0x40
	strb r0, [r4, #0xf]
	strh r1, [r4, #0x10]
	bl sub_80C1E74
	cmp r0, #2
	bne _08030DBC
	ldrb r1, [r4, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08030DC8
	bl NextRN_100
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	strb r1, [r4, #0xd]
	b _08030DC8
	.align 2, 0
_08030DB0: .4byte 0x08015319  @ sub_8015318
_08030DB4: .4byte 0x080152C9  @ sub_80152C8
_08030DB8: .4byte 0x0202BCEC
_08030DBC:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
_08030DC8:
	ldr r5, _08030E38 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	movs r4, #0
	strb r0, [r5, #0x15]
	bl InitBmBgLayers
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl sub_8019194
	bl sub_802E2E0
	bl sub_8000CD8
	str r0, [r5, #4]
	movs r2, #0
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x48
	strh r4, [r0]
	adds r3, r5, #0
	adds r3, #0x4a
	ldrb r1, [r3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x4b
	strb r2, [r1]
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	movs r4, #1
_08030E12:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08030E44
	ldr r0, [r2]
	cmp r0, #0
	beq _08030E44
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08030E3C
	movs r0, #8
	orrs r1, r0
	b _08030E42
	.align 2, 0
_08030E38: .4byte 0x0202BCEC
_08030E3C:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
_08030E42:
	str r1, [r2, #0xc]
_08030E44:
	adds r4, #1
	cmp r4, #0x3f
	ble _08030E12
	bl sub_8018BCC
	bl sub_80379A8
	cmp r6, #0
	beq _08030E5C
	adds r0, r6, #0
	bl sub_8031108
_08030E5C:
	ldr r0, _08030E90 @ =0x020228A8
	movs r1, #0
	strh r1, [r0]
	bl sub_8001EE4
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030E90: .4byte 0x020228A8

