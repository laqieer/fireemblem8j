	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set GetUnitFromCharIdAndFaction, 0x08017FEC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_800FA64, 0x0800FA64 + 1
	.set sub_801786C, 0x0801786C + 1
	.set UnitApplyBonusLevels, 0x08017DE8 + 1
	.set sub_8018144, 0x08018144 + 1
	.set sub_807C44C, 0x0807C44C + 1
	.section .text.sub_800F8D4, "ax", %progbits
@ sub_800F8D4 @ JP 0x0800F8D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F8D4
	.thumb_func
sub_800F8D4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	asrs r4, r3, #0x18
	ldr r1, _0800F910 @ =0x080DC56C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F914
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	b _0800F938
	.align 2, 0
_0800F910: .4byte 0x080DC56C
_0800F914:
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	adds r5, r0, #0
	cmp r5, #0
	beq _0800F93E
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_8018144
	ldrb r0, [r6]
	bl GetUnitFromCharId
_0800F938:
	adds r5, r0, #0
	cmp r5, #0
	bne _0800F960
_0800F93E:
	adds r0, r6, #0
	bl sub_801786C
	adds r5, r0, #0
	cmp r4, #1
	bne _0800F9CA
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F9CA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800F9CA
_0800F960:
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F9CA
	ldr r1, [r5, #0xc]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0xc]
	cmp r4, #1
	bne _0800F988
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800F998
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r1, r0
	b _0800F996
_0800F988:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800F998
	ldr r0, _0800FA20 @ =0xFFBFFFFF
	ands r1, r0
_0800F996:
	str r1, [r5, #0xc]
_0800F998:
	add r4, sp, #4
	mov r7, sp
	adds r7, #5
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_807C44C
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _0800F9CA
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r1, r0
	bne _0800F9CA
	ldr r0, _0800FA24 @ =0x0000FFFE
	mov r1, r8
	ands r1, r0
	mov r8, r1
_0800F9CA:
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x10]
	ldrh r0, [r6, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x11]
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne _0800FA48
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x3b
	bls _0800FA48
	ldr r1, _0800FA28 @ =0x0202BCEC
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	adds r2, r1, #0
	cmp r0, #0
	blt _0800FA2C
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800FA36
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x14]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	rsbs r1, r1, #0
	adds r0, r5, #0
	bl UnitApplyBonusLevels
	b _0800FA48
	.align 2, 0
_0800FA20: .4byte 0xFFBFFFFF
_0800FA24: .4byte 0x0000FFFE
_0800FA28: .4byte 0x0202BCEC
_0800FA2C:
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800FA48
_0800FA36:
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x14]
	lsrs r1, r1, #4
	adds r0, r5, #0
	bl UnitApplyBonusLevels
_0800FA48:
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	mov r3, sb
	bl sub_800FA64
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

