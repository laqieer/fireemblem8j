	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80BCD5C, 0x080BCD5C + 1
	.section .text.sub_80BCD74, "ax", %progbits
@ sub_80BCD74 @ JP 0x080BCD74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCD74
	.thumb_func
sub_80BCD74:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x4c
	adds r5, r1, r0
	adds r0, r2, #0
	cmp r2, #0
	bge _080BCD94
	ldr r1, _080BCDB8 @ =0x0000021F
	adds r0, r3, r1
_080BCD94:
	asrs r0, r0, #9
	lsls r0, r0, #9
	subs r0, r2, r0
	cmp r0, #0xff
	ble _080BCDC0
	adds r0, r2, #0
	cmp r2, #0
	bge _080BCDA8
	ldr r1, _080BCDBC @ =0x0000011F
	adds r0, r3, r1
_080BCDA8:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	b _080BCDD0
	.align 2, 0
_080BCDB8: .4byte 0x0000021F
_080BCDBC: .4byte 0x0000011F
_080BCDC0:
	adds r0, r2, #0
	cmp r2, #0
	bge _080BCDCA
	ldr r1, _080BCE2C @ =0x0000011F
	adds r0, r3, r1
_080BCDCA:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r1, r2, r0
_080BCDD0:
	strh r1, [r5]
	ldr r1, [r4, #0x2c]
	lsls r0, r1, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r0, [r0]
	adds r2, r4, #0
	adds r2, #0x40
	cmp r0, #0
	bne _080BCDEE
	adds r1, r2, r1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080BCDEE:
	ldr r3, [r4, #0x2c]
	adds r0, r2, r3
	adds r1, r4, #0
	adds r1, #0x3a
	adds r1, r1, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BCE5C
	lsls r0, r3, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080BCE5C
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _080BCE30 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BCE34
	cmp r3, #3
	bne _080BCE34
	movs r0, #0xf
	adds r1, r4, #0
	bl sub_80BCD5C
	b _080BCE3E
	.align 2, 0
_080BCE2C: .4byte 0x0000011F
_080BCE30: .4byte 0x0202BCEC
_080BCE34:
	ldr r0, [r4, #0x2c]
	adds r0, #0xa
	adds r1, r4, #0
	bl sub_80BCD5C
_080BCE3E:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldr r0, _080BCE64 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BCE56
	movs r0, #0x85
	bl m4aSongNumStart
_080BCE56:
	adds r0, r4, #0
	bl sub_8002DE4
_080BCE5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE64: .4byte 0x0202BCEC

