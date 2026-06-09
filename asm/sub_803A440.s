	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set StartAiTargetCursor, 0x08039F44 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_8037ACC, 0x08037ACC + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_803A440, "ax", %progbits
@ sub_803A440 @ JP 0x0803A440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A440
	.thumb_func
sub_803A440:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _0803A46C @ =0x0203A954
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	bne _0803A456
	b _0803A550
_0803A456:
	ldr r0, _0803A470 @ =0x0203AA90
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0xd
	bhi _0803A53A
	lsls r0, r1, #2
	ldr r1, _0803A474 @ =_0803A478
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A46C: .4byte 0x0203A954
_0803A470: .4byte 0x0203AA90
_0803A474: .4byte _0803A478
_0803A478: @ jump table
	.4byte _0803A550 @ case 0
	.4byte _0803A4B0 @ case 1
	.4byte _0803A550 @ case 2
	.4byte _0803A51C @ case 3
	.4byte _0803A550 @ case 4
	.4byte _0803A528 @ case 5
	.4byte _0803A550 @ case 6
	.4byte _0803A520 @ case 7
	.4byte _0803A524 @ case 8
	.4byte _0803A550 @ case 9
	.4byte _0803A550 @ case 10
	.4byte _0803A550 @ case 11
	.4byte _0803A550 @ case 12
	.4byte _0803A550 @ case 13
_0803A4B0:
	ldr r1, _0803A4C0 @ =0x0203AA90
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0803A4C4
	ldrb r6, [r1, #8]
	ldrb r5, [r1, #9]
	b _0803A4D2
	.align 2, 0
_0803A4C0: .4byte 0x0203AA90
_0803A4C4:
	ldrb r0, [r1, #6]
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_0803A4D2:
	ldr r7, _0803A514 @ =0x0203AA90
	movs r1, #7
	ldrsb r1, [r7, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803A53A
	ldr r4, _0803A518 @ =0x03004DF0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0803A53A
	bl sub_807B4B8
	ldr r1, [r4]
	ldrb r0, [r7, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r7, #3]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl sub_8037ACC
	ldr r0, [r4]
	bl sub_807A888
	bl sub_807AB0C
	b _0803A53A
	.align 2, 0
_0803A514: .4byte 0x0203AA90
_0803A518: .4byte 0x03004DF0
_0803A51C:
	ldrb r0, [r2, #6]
	b _0803A52E
_0803A520:
	ldrb r0, [r2, #6]
	b _0803A52E
_0803A524:
	ldrb r0, [r2, #9]
	b _0803A52E
_0803A528:
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _0803A550
_0803A52E:
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_0803A53A:
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8015E18
	lsls r0, r6, #4
	lsls r1, r5, #4
	movs r2, #2
	mov r3, r8
	bl StartAiTargetCursor
_0803A550:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

