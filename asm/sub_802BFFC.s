	.syntax unified
	.set GetItemAwardedExp, 0x08017540 + 1
	.section .text.sub_802BFFC, "ax", %progbits
@ sub_802BFFC @ JP 0x0802BFFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802BFFC
	.thumb_func
sub_802BFFC:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C05A
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0802C05A
	ldr r0, _0802C060 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C05A
	ldr r0, _0802C064 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802C05A
	ldr r0, _0802C068 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802C06C
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802C05A
	ldr r1, [r7, #0x4c]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0802C05A
	movs r0, #0x88
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0802C06C
_0802C05A:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802C0F2
	.align 2, 0
_0802C060: .4byte 0x0202BCEC
_0802C064: .4byte 0x0202BCAC
_0802C068: .4byte 0x0203A4D0
_0802C06C:
	adds r5, r7, #0
	adds r5, #0x50
	ldrb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x28
	adds r0, r4, r0
	ldrb r6, [r0]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemAwardedExp
	adds r1, r7, #0
	adds r1, #0x7b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	adds r6, r6, r0
	movs r1, #0
	ldrb r3, [r5]
_0802C096:
	ldr r2, [r7, #4]
	cmp r1, r3
	beq _0802C0B8
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfb
	beq _0802C0B8
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _0802C0B8
	cmp r6, #0xfa
	ble _0802C0BE
	movs r6, #0xfa
	b _0802C0BE
_0802C0B8:
	adds r1, #1
	cmp r1, #7
	ble _0802C096
_0802C0BE:
	ldr r0, [r7]
	ldr r4, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0802C0D8
	cmp r6, #0xfb
	ble _0802C0F0
	movs r6, #0xfb
	b _0802C0F0
_0802C0D8:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r4, r0
	cmp r4, #0
	beq _0802C0EA
	cmp r6, #0x47
	ble _0802C0F0
	movs r6, #0x47
	b _0802C0F0
_0802C0EA:
	cmp r6, #0xb5
	ble _0802C0F0
	movs r6, #0xb5
_0802C0F0:
	adds r0, r6, #0
_0802C0F2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

