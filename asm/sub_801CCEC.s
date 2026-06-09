	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnit, 0x08019108 + 1
	.set WriteSuspendSave, 0x080AA460 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801CC58, 0x0801CC58 + 1
	.set sub_801CC70, 0x0801CC70 + 1
	.section .text.sub_801CCEC, "ax", %progbits
@ sub_801CCEC @ JP 0x0801CCEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CCEC
	.thumb_func
sub_801CCEC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801CD2C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8015E18
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	asrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x22
	bls _0801CD20
	b _0801CE30
_0801CD20:
	lsls r0, r0, #2
	ldr r1, _0801CD30 @ =_0801CD34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CD2C: .4byte 0x0203A954
_0801CD30: .4byte _0801CD34
_0801CD34: @ jump table
	.4byte _0801CDC0 @ case 0
	.4byte _0801CE30 @ case 1
	.4byte _0801CE30 @ case 2
	.4byte _0801CE30 @ case 3
	.4byte _0801CE30 @ case 4
	.4byte _0801CE30 @ case 5
	.4byte _0801CE30 @ case 6
	.4byte _0801CE30 @ case 7
	.4byte _0801CE30 @ case 8
	.4byte _0801CE30 @ case 9
	.4byte _0801CE30 @ case 10
	.4byte _0801CE04 @ case 11
	.4byte _0801CE04 @ case 12
	.4byte _0801CE30 @ case 13
	.4byte _0801CE30 @ case 14
	.4byte _0801CE30 @ case 15
	.4byte _0801CE30 @ case 16
	.4byte _0801CE30 @ case 17
	.4byte _0801CE30 @ case 18
	.4byte _0801CE30 @ case 19
	.4byte _0801CE30 @ case 20
	.4byte _0801CE30 @ case 21
	.4byte _0801CE30 @ case 22
	.4byte _0801CE30 @ case 23
	.4byte _0801CE30 @ case 24
	.4byte _0801CE30 @ case 25
	.4byte _0801CE30 @ case 26
	.4byte _0801CDE6 @ case 27
	.4byte _0801CDF4 @ case 28
	.4byte _0801CE20 @ case 29
	.4byte _0801CE30 @ case 30
	.4byte _0801CE30 @ case 31
	.4byte _0801CE30 @ case 32
	.4byte _0801CE14 @ case 33
	.4byte _0801CE14 @ case 34
_0801CDC0:
	ldr r0, _0801CDD4 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CDDC
	ldr r1, _0801CDD8 @ =0x0203A954
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	b _0801CE30
	.align 2, 0
_0801CDD4: .4byte 0x0202BCAC
_0801CDD8: .4byte 0x0203A954
_0801CDDC:
	adds r0, r6, #0
	bl sub_801CC70
	movs r0, #1
	b _0801CE9A
_0801CDE6:
	ldr r0, _0801CDF0 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #2
	b _0801CE1C
	.align 2, 0
_0801CDF0: .4byte 0x0202BCAC
_0801CDF4:
	ldr r0, _0801CE00 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #4
	b _0801CE1C
	.align 2, 0
_0801CE00: .4byte 0x0202BCAC
_0801CE04:
	ldr r0, _0801CE10 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #1
	b _0801CE1C
	.align 2, 0
_0801CE10: .4byte 0x0202BCAC
_0801CE14:
	ldr r0, _0801CE2C @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #8
_0801CE1C:
	orrs r1, r2
	strb r1, [r0]
_0801CE20:
	adds r0, r6, #0
	bl sub_801CC58
	movs r0, #1
	b _0801CE9A
	.align 2, 0
_0801CE2C: .4byte 0x0202BCAC
_0801CE30:
	ldr r4, _0801CE68 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	adds r2, r0, #0
	ldr r0, _0801CE6C @ =0x0203A4E8
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	cmp r2, #0x8a
	beq _0801CE98
	cmp r2, #0x8a
	bgt _0801CE70
	cmp r2, #0x64
	blt _0801CE7C
	cmp r2, #0x68
	ble _0801CE98
	cmp r2, #0x88
	beq _0801CE98
	b _0801CE7C
	.align 2, 0
_0801CE68: .4byte 0x0203A954
_0801CE6C: .4byte 0x0203A4E8
_0801CE70:
	cmp r2, #0x97
	blt _0801CE7C
	cmp r2, #0x99
	ble _0801CE98
	cmp r2, #0xc1
	beq _0801CE98
_0801CE7C:
	ldr r1, _0801CEA0 @ =0x0203A954
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq _0801CE98
	ldr r0, _0801CEA4 @ =0x0202BCAC
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801CE98
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
_0801CE98:
	adds r0, r5, #0
_0801CE9A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801CEA0: .4byte 0x0203A954
_0801CEA4: .4byte 0x0202BCAC

