	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_804AF8C, "ax", %progbits
@ sub_804AF8C @ JP 0x0804AF8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AF8C
	.thumb_func
sub_804AF8C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0804AFC4 @ =0x03004DF0
	ldr r1, [r0]
	ldr r6, _0804AFC8 @ =0x0203DD8C
	ldrb r0, [r6, #7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804AFCC
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _0804AFCC
	strb r0, [r6, #6]
	b _0804B04E
	.align 2, 0
_0804AFC4: .4byte 0x03004DF0
_0804AFC8: .4byte 0x0203DD8C
_0804AFCC:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne _0804AFEC
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne _0804AFEC
	ldr r0, _0804AFE8 @ =0x0203DD8C
	strb r1, [r0, #6]
	b _0804B04E
	.align 2, 0
_0804AFE8: .4byte 0x0203DD8C
_0804AFEC:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne _0804B00C
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne _0804B00C
	ldr r0, _0804B008 @ =0x0203DD8C
	strb r4, [r0, #6]
	b _0804B04E
	.align 2, 0
_0804B008: .4byte 0x0203DD8C
_0804B00C:
	ldr r1, _0804B02C @ =0x03001810
	ldr r4, _0804B030 @ =0x0203DD8C
	ldrb r0, [r4, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0804B034
	movs r0, #1
	strb r0, [r4, #6]
	b _0804B04E
	.align 2, 0
_0804B02C: .4byte 0x03001810
_0804B030: .4byte 0x0203DD8C
_0804B034:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _0804B044
	movs r0, #2
	strb r0, [r4, #6]
	b _0804B04E
_0804B044:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl sub_8003508
_0804B04E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

