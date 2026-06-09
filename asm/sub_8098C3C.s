	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8097544, 0x08097544 + 1
	.set sub_80989AC, 0x080989AC + 1
	.set sub_80989D4, 0x080989D4 + 1
	.set sub_8098A94, 0x08098A94 + 1
	.set sub_8098B54, 0x08098B54 + 1
	.set sub_8098C14, 0x08098C14 + 1
	.section .text.sub_8098C3C, "ax", %progbits
@ sub_8098C3C @ JP 0x08098C3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098C3C
	.thumb_func
sub_8098C3C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r4, #0xa0
	movs r5, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098C58
	b _08098D64
_08098C58:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08098CCC
	lsls r0, r0, #2
	ldr r1, _08098C6C @ =_08098C70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08098C6C: .4byte _08098C70
_08098C70: @ jump table
	.4byte _08098CCC @ case 0
	.4byte _08098C84 @ case 1
	.4byte _08098C98 @ case 2
	.4byte _08098CAC @ case 3
	.4byte _08098CC0 @ case 4
_08098C84:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80989D4
	b _08098CCC
_08098C98:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8098A94
	b _08098CCC
_08098CAC:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8098B54
	b _08098CCC
_08098CC0:
	movs r2, #0xc7
	lsls r2, r2, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8098C14
_08098CCC:
	movs r0, #0x33
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	ldr r6, _08098D50 @ =0x0000B6C0
	movs r5, #0x80
	movs r4, #2
_08098CDE:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x18
	ldr r3, _08098D54 @ =0x085B8D24
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08098CDE
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08098D0A
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D1C
_08098D0A:
	ldr r3, _08098D58 @ =0x08A94B92
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08098D1C:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _08098D30
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D42
_08098D30:
	ldr r3, _08098D5C @ =0x08A94BBA
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	bl PutSpriteExt
_08098D42:
	ldr r2, _08098D60 @ =0x00009380
	movs r0, #0x74
	movs r1, #0x28
	bl sub_80989AC
	b _08098D88
	.align 2, 0
_08098D50: .4byte 0x0000B6C0
_08098D54: .4byte 0x085B8D24
_08098D58: .4byte 0x08A94B92
_08098D5C: .4byte 0x08A94BBA
_08098D60: .4byte 0x00009380
_08098D64:
	bl sub_8097544
	cmp r0, #0
	beq _08098D7E
	ldr r3, _08098D98 @ =0x08A94BA6
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08098D7E:
	ldr r2, _08098D9C @ =0x00009380
	movs r0, #0x74
	movs r1, #0x20
	bl sub_80989AC
_08098D88:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098D98: .4byte 0x08A94BA6
_08098D9C: .4byte 0x00009380

