	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetClassData, 0x0801911C + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_80D17C8, 0x080D17C8 + 1
	.set sub_80D1844, 0x080D1844 + 1
	.set sub_80D18F0, 0x080D18F0 + 1
	.set sub_80D19A0, 0x080D19A0 + 1
	.set sub_80D2100, 0x080D2100 + 1
	.set sub_80D216C, 0x080D216C + 1
	.set sub_80D2260, 0x080D2260 + 1
	.set sub_80D2AD8, 0x080D2AD8 + 1
	.section .text.sub_80D1A50, "ax", %progbits
@ sub_80D1A50 @ JP 0x080D1A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1A50
	.thumb_func
sub_80D1A50:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x29
	movs r4, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, [sp, #4]
	adds r0, #0x38
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	movs r0, #9
	str r0, [r5, #0x50]
	ldr r0, _080D1B88 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080D1B8C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080D1B90 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	bl sub_804F8F4
	bl sub_801569C
	movs r1, #1
	rsbs r1, r1, #0
	movs r2, #0xfb
	lsls r2, r2, #1
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r3, #0x58
	bl sub_80D216C
	bl sub_80D18F0
	ldr r0, [r5, #0x50]
	movs r1, #0x8c
	lsls r1, r1, #1
	movs r2, #0x68
	bl sub_80D2100
	strh r4, [r5, #0x32]
	strh r4, [r5, #0x34]
	strh r4, [r5, #0x36]
	movs r4, #1
_080D1AC8:
	adds r0, r4, #0
	bl GetUnit
	mov sl, r0
	cmp r0, #0
	bne _080D1AD6
	b _080D1BF6
_080D1AD6:
	ldr r0, [r0]
	cmp r0, #0
	bne _080D1ADE
	b _080D1BF6
_080D1ADE:
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r0, [r0, #4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080D1AEC
	b _080D1BF6
_080D1AEC:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	mov r0, sl
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0
	mov r8, r2
	adds r0, r5, #0
	adds r0, #0x4a
	str r0, [sp, #0x18]
	adds r1, r5, #0
	adds r1, #0x48
	str r1, [sp, #0x14]
	adds r2, r5, #0
	adds r2, #0x40
	str r2, [sp, #0xc]
	subs r0, #9
	str r0, [sp, #0x10]
	adds r3, r5, #0
	adds r3, #0x38
	adds r7, r5, #0
	adds r7, #0x32
	adds r6, r5, #0
	adds r6, #0x2c
_080D1B26:
	ldr r1, [sp, #8]
	lsls r4, r1, #1
	add r4, r8
	ldr r2, _080D1B94 @ =0x089CDD18
	adds r4, r4, r2
	ldrb r0, [r4]
	strh r0, [r6]
	ldrb r1, [r4]
	adds r0, r7, #0
	mov r2, sb
	str r3, [sp, #0x1c]
	bl sub_80D2260
	ldr r1, [sp, #0x18]
	add r1, r8
	strb r0, [r1]
	ldrb r0, [r4]
	bl GetClassData
	ldrh r0, [r0, #2]
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	adds r3, #2
	adds r7, #2
	adds r6, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #1
	ble _080D1B26
	mov r0, sb
	ldr r2, [sp, #0x14]
	strh r0, [r2]
	bl sub_80D19A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D1C0A
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	cmp r0, #0x3e
	beq _080D1BBA
	cmp r0, #0x3e
	bgt _080D1B98
	cmp r0, #0x3d
	beq _080D1BA0
	b _080D1C0A
	.align 2, 0
_080D1B88: .4byte 0x02022CA8
_080D1B8C: .4byte 0x020234A8
_080D1B90: .4byte 0x02023CA8
_080D1B94: .4byte 0x089CDD18
_080D1B98:
	ldr r2, [sp, #8]
	cmp r2, #0x47
	beq _080D1BD4
	b _080D1C0A
_080D1BA0:
	movs r0, #0x7e
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7e
	mov r2, sb
	bl sub_80D2260
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7e
	b _080D1BEC
_080D1BBA:
	movs r0, #0x7f
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7f
	mov r2, sb
	bl sub_80D2260
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7f
	b _080D1BEC
_080D1BD4:
	movs r0, #0x37
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x37
	mov r2, sb
	bl sub_80D2260
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x37
_080D1BEC:
	bl GetClassData
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x3c]
	b _080D1C0A
_080D1BF6:
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x40
	str r0, [sp, #0xc]
	adds r1, r5, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	cmp r4, #0x3f
	bgt _080D1C0A
	b _080D1AC8
_080D1C0A:
	ldrh r0, [r5, #0x32]
	cmp r0, #0
	bne _080D1C1A
	ldrh r0, [r5, #0x34]
	cmp r0, #0
	bne _080D1C1A
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
_080D1C1A:
	movs r1, #0
	movs r0, #1
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	bl sub_80D17C8
	adds r0, r5, #0
	bl sub_80D1844
	bl sub_801569C
	adds r0, r5, #0
	bl sub_80D2AD8
	str r0, [r5, #0x54]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _080D1C56
	bl sub_8097CFC
	movs r0, #0xf
	bl BG_EnableSyncByMask
_080D1C56:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

