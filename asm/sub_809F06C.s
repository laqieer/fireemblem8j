	.syntax unified
	.set DrawPrepScreenItemUseStatBars, 0x0809E37C + 1
	.set DrawPrepScreenItemUseStatValues, 0x0809E51C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F24, 0x08018F24 + 1
	.set sub_8018F64, 0x08018F64 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.set sub_802F728, 0x0802F728 + 1
	.set sub_8081138, 0x08081138 + 1
	.set sub_8081330, 0x08081330 + 1
	.set sub_809EFAC, 0x0809EFAC + 1
	.section .text.sub_809F06C, "ax", %progbits
@ sub_809F06C @ JP 0x0809F06C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F06C
	.thumb_func
sub_809F06C:
	push {r4, r5, r6, r7, lr}
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
	bl sub_8018E64
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018EC4
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018EE4
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F24
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018FAC
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F64
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F84
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802F728
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	bl sub_8018E64
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018EC4
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018EE4
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F24
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018FAC
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F64
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl sub_8018F84
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	strb r1, [r0]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809EFAC
	movs r4, #0
_0809F188:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0809F1B6
	asrs r1, r4, #2
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x2a
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_8081330
_0809F1B6:
	adds r4, #1
	cmp r4, #7
	ble _0809F188
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809F1DC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F1D2
	movs r0, #0x5a
	bl m4aSongNumStart
_0809F1D2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1DC: .4byte 0x0202BCEC

