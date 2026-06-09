	.syntax unified
	.set DrawPrepScreenItemUseStatBars, 0x0809E37C + 1
	.set DrawPrepScreenItemUseStatValues, 0x0809E51C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_802F8C4, 0x0802F8C4 + 1
	.set sub_8081138, 0x08081138 + 1
	.set sub_8081330, 0x08081330 + 1
	.set sub_809F2AC, 0x0809F2AC + 1
	.section .text.sub_809F370, "ax", %progbits
@ sub_809F370 @ JP 0x0809F370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F370
	.thumb_func
sub_809F370:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_8081138
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802F8C4
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	adds r4, r7, #0
	adds r4, #0x31
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809F2AC
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _0809F3F0
	adds r2, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r2, r2, r0
	movs r0, #0xb0
	movs r1, #0x1a
	bl sub_8081330
_0809F3F0:
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809F414 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F406
	movs r0, #0x5a
	bl m4aSongNumStart
_0809F406:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F414: .4byte 0x0202BCEC

