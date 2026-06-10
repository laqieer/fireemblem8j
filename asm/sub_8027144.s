	.syntax unified
	.set AddUnitSprite, 0x08027310 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitDisplayedSpritePalette, 0x080270E0 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8027144, "ax", %progbits
@ sub_8027144 @ JP 0x08027144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027144
	.thumb_func
sub_8027144:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _08027264 @ =0x0203A4C4
	ldr r1, _08027268 @ =0x0203A014
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_08027164:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08027226
	ldr r0, [r6]
	cmp r0, #0
	beq _08027226
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r3, [r6, #0xc]
	ldr r0, _0802726C @ =0x00000201
	ands r0, r3
	cmp r0, #0
	bne _08027226
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _08027270 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027226
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _080271B0
	cmp r1, #0xd
	bne _080271B6
_080271B0:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0xc]
_080271B6:
	lsls r0, r2, #4
	bl AddUnitSprite
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl sub_80176AC
	bl sub_80267A0
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl sub_80176AC
	ldr r2, _08027274 @ =0x08903E0C
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08027212
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_08027212:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08027224
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_08027224:
	str r5, [r6, #0x3c]
_08027226:
	adds r7, #1
	cmp r7, #0xc5
	ble _08027164
	movs r0, #0
	bl sub_802EAC4
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _080272F0
	ldr r1, _08027278 @ =0xFFFFC080
	adds r6, r1, #0
	ldr r7, _0802727C @ =0x089040E6
	movs r2, #0x58
	adds r2, r2, r7
	mov sb, r2
_08027246:
	cmp r0, #1
	bne _080272BA
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080272BA
	ldrb r0, [r4, #3]
	cmp r0, #0x36
	beq _0802728A
	cmp r0, #0x36
	bgt _08027280
	cmp r0, #0x35
	beq _08027286
	b _0802729C
	.align 2, 0
_08027264: .4byte 0x0203A4C4
_08027268: .4byte 0x0203A014
_0802726C: .4byte 0x00000201
_08027270: .4byte 0x0202E4D4
_08027274: .4byte 0x08903E0C
_08027278: .4byte 0xFFFFC080
_0802727C: .4byte 0x089040E6
_08027280:
	cmp r0, #0x37
	beq _0802728E
	b _0802729C
_08027286:
	movs r0, #0x5b
	b _08027290
_0802728A:
	movs r0, #0x5c
	b _08027290
_0802728E:
	movs r0, #0x5d
_08027290:
	bl sub_80267A0
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0802729C:
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	ldrb r0, [r4]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	mov r0, r8
	strh r0, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_080272BA:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	bne _080272E8
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	ldrb r0, [r4]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	movs r0, #0x66
	bl sub_80267A0
	ldr r1, _08027308 @ =0xFFFFB080
	adds r0, r0, r1
	strh r0, [r5, #8]
	mov r2, sb
	ldrh r0, [r2]
	strb r0, [r5, #0xb]
_080272E8:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08027246
_080272F0:
	ldr r0, _0802730C @ =0x0203A4C8
	ldr r0, [r0]
	cmp r0, #0
	beq _080272FC
	bl sub_8026F38
_080272FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027308: .4byte 0xFFFFB080
_0802730C: .4byte 0x0203A4C8

