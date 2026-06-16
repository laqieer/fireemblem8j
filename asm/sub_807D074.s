	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set LoadUnits, 0x080177DC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_807D074, "ax", %progbits
@ GenerateSummonUnitDef @ JP 0x0807D074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateSummonUnitDef
	.thumb_func
GenerateSummonUnitDef:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x80
	bl AdvanceGetLCGRNValue
	movs r1, #0x65
	bl sub_80D637C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r5, #1
	rsbs r5, r5, #0
	movs r3, #0
	ldr r0, _0807D0A8 @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _0807D0AC @ =0x089CFD18
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807D0B0
	movs r5, #0
	b _0807D0D0
	.align 2, 0
_0807D0A8: .4byte 0x03004DF0
_0807D0AC: .4byte 0x089CFD18
_0807D0B0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #2
	bgt _0807D0D0
	ldr r0, _0807D144 @ =0x03004DF0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r1, _0807D148 @ =0x089CFD18
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r1, [r2, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807D0B0
	adds r5, r3, #0
_0807D0D0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0807D0DA
	b _0807D2E8
_0807D0DA:
	movs r4, #1
	lsls r5, r5, #1
	mov r8, r5
	ldr r0, _0807D14C @ =0x089CFD19
	adds r5, r5, r0
_0807D0E4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807D104
	ldr r0, [r1]
	cmp r0, #0
	beq _0807D104
	ldrb r0, [r0, #4]
	ldrb r2, [r5]
	cmp r0, r2
	bne _0807D104
	adds r0, r1, #0
	bl sub_801759C
_0807D104:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D0E4
	movs r4, #0
	ldr r2, _0807D150 @ =0x03001C30
	ldr r3, _0807D148 @ =0x089CFD18
	adds r0, r3, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0x51
	strb r0, [r2, #1]
	strb r4, [r2, #2]
	ldrb r1, [r2, #3]
	movs r0, #1
	adds r4, r1, #0
	orrs r4, r0
	strb r4, [r2, #3]
	ldr r1, _0807D144 @ =0x03004DF0
	ldr r0, [r1]
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r0, #0xc0
	ands r5, r0
	mov ip, r1
	mov sb, r3
	adds r6, r2, #0
	cmp r5, #0
	bne _0807D154
	subs r0, #0xc7
	ands r4, r0
	b _0807D170
	.align 2, 0
_0807D144: .4byte 0x03004DF0
_0807D148: .4byte 0x089CFD18
_0807D14C: .4byte 0x089CFD19
_0807D150: .4byte 0x03001C30
_0807D154:
	cmp r5, #0x80
	bne _0807D162
	movs r0, #7
	rsbs r0, r0, #0
	ands r4, r0
	movs r0, #4
	b _0807D16E
_0807D162:
	cmp r5, #0x40
	bne _0807D172
	movs r0, #7
	rsbs r0, r0, #0
	ands r4, r0
	movs r0, #2
_0807D16E:
	orrs r4, r0
_0807D170:
	strb r4, [r6, #3]
_0807D172:
	mov r1, ip
	ldr r0, [r1]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrb r2, [r6, #3]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #3]
	ldr r3, _0807D1EC @ =0x0203A954
	movs r0, #0x3f
	ldrb r1, [r3, #0x13]
	ands r1, r0
	ldrb r2, [r6, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	ldrb r1, [r3, #0x14]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r6, #4]
	ldr r0, _0807D1F0 @ =0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, #4]
	movs r0, #0
	strb r0, [r6, #7]
	str r0, [r6, #8]
	ldrb r1, [r6, #5]
	subs r0, #0x11
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6, #5]
	movs r1, #0
	movs r3, #3
	adds r0, r6, #0
	adds r0, #0xf
_0807D1C6:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0807D1C6
	mov r2, ip
	ldr r0, [r2]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _0807D238
	cmp r0, #0xa
	bgt _0807D1F4
	cmp r7, #5
	bhi _0807D238
	movs r0, #0x27
	b _0807D23A
	.align 2, 0
_0807D1EC: .4byte 0x0203A954
_0807D1F0: .4byte 0xFFFFF03F
_0807D1F4:
	cmp r0, #0xf
	bgt _0807D20E
	cmp r7, #5
	bhi _0807D200
	movs r0, #0x27
	b _0807D23A
_0807D200:
	subs r0, r7, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _0807D238
	movs r0, #0x24
	b _0807D23A
_0807D20E:
	cmp r0, #0x14
	bgt _0807D23C
	cmp r7, #5
	bhi _0807D21A
	movs r0, #0x27
	b _0807D23A
_0807D21A:
	subs r0, r7, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _0807D228
	movs r0, #0x24
	b _0807D23A
_0807D228:
	adds r0, r7, #0
	subs r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0807D238
	movs r0, #0x29
	b _0807D23A
_0807D238:
	movs r0, #0x1f
_0807D23A:
	strb r0, [r6, #0xc]
_0807D23C:
	ldr r0, _0807D2B8 @ =0x03001C30
	movs r1, #0
	movs r3, #3
	adds r0, #0x13
_0807D244:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0807D244
	mov r0, sb
	adds r0, #1
	mov r1, r8
	adds r5, r1, r0
	ldrb r0, [r5]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	bne _0807D27E
	ldr r4, _0807D2BC @ =0x0203A4E8
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x80
	bl memcpy
	ldr r0, _0807D2B8 @ =0x03001C30
	bl LoadUnits
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0x80
	bl memcpy
_0807D27E:
	ldrb r0, [r5]
	bl GetUnitFromCharId
	adds r4, r0, #0
	movs r1, #0
	movs r3, #3
	adds r0, #0x2b
_0807D28C:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0807D28C
	ldr r1, _0807D2C0 @ =0x03004DF0
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	strb r0, [r4, #8]
	movs r0, #0xff
	strb r0, [r4, #9]
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bgt _0807D2C4
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0x1f
	b _0807D2E6
	.align 2, 0
_0807D2B8: .4byte 0x03001C30
_0807D2BC: .4byte 0x0203A4E8
_0807D2C0: .4byte 0x03004DF0
_0807D2C4:
	cmp r0, #0xa
	bgt _0807D2D0
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0x47
	b _0807D2E6
_0807D2D0:
	cmp r0, #0xf
	bgt _0807D2DC
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0x79
	b _0807D2E6
_0807D2DC:
	cmp r0, #0x14
	bgt _0807D2E8
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0xb5
_0807D2E6:
	strb r0, [r1]
_0807D2E8:
	add sp, #0x80
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

