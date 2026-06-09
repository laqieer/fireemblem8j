	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_80B9F7C, 0x080B9F7C + 1
	.section .text.sub_80D2C84, "ax", %progbits
@ sub_80D2C84 @ JP 0x080D2C84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2C84
	.thumb_func
sub_80D2C84:
	push {r4, r5, lr}
	sub sp, #4
	bl sub_8000CD8
	ldr r3, _080D2D10 @ =0x08BABAF8
	movs r4, #0x80
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #3
	movs r1, #0x10
	movs r2, #8
	bl PutSprite
	ldr r5, _080D2D14 @ =0x08BABAF4
	ldr r0, [r5]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D2CB8
	ldr r3, _080D2D18 @ =0x08BABB12
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #3
	bl PutSprite
_080D2CB8:
	ldr r3, _080D2D1C @ =0x08BABB20
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #0xf
	bl PutSprite
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r4, r0, #5
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080D2DB4
	cmp r0, #1
	bgt _080D2D20
	cmp r0, #0
	beq _080D2D26
	b _080D2E16
	.align 2, 0
_080D2D10: .4byte 0x08BABAF8
_080D2D14: .4byte 0x08BABAF4
_080D2D18: .4byte 0x08BABB12
_080D2D1C: .4byte 0x08BABB20
_080D2D20:
	cmp r0, #2
	beq _080D2DC6
	b _080D2E16
_080D2D26:
	lsls r1, r3, #3
	movs r0, #0xc
	bl sub_804F528
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2D46
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #6
	bgt _080D2D50
	b _080D2E16
_080D2D46:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #6
	ble _080D2E16
_080D2D50:
	ldr r4, _080D2D8C @ =0x08BABAF4
	ldr r0, [r4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080D2D6C
	ldr r2, _080D2D90 @ =0x000030E0
	movs r0, #0x20
	movs r1, #0x20
	movs r3, #1
	bl sub_80B9F7C
_080D2D6C:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2D94
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	blt _080D2DA0
	b _080D2E16
	.align 2, 0
_080D2D8C: .4byte 0x08BABAF4
_080D2D90: .4byte 0x000030E0
_080D2D94:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	bge _080D2E16
_080D2DA0:
	ldr r2, _080D2DB0 @ =0x000030E0
	movs r0, #0x20
	movs r1, #0x88
	movs r3, #0
	bl sub_80B9F7C
	b _080D2E16
	.align 2, 0
_080D2DB0: .4byte 0x000030E0
_080D2DB4:
	lsls r1, r3, #3
	movs r0, #0xc
	bl sub_804F5D4
	lsls r1, r4, #3
	movs r0, #0x50
	bl sub_804F528
	b _080D2E16
_080D2DC6:
	lsls r1, r3, #3
	movs r0, #0xc
	bl sub_804F5D4
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #4
	bls _080D2E16
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080D2DF4
	ldr r2, _080D2E3C @ =0x000030E0
	movs r0, #0x90
	movs r1, #0x38
	movs r3, #1
	bl sub_80B9F7C
_080D2DF4:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080D2E16
	ldr r2, _080D2E3C @ =0x000030E0
	movs r0, #0x90
	movs r1, #0x80
	movs r3, #0
	bl sub_80B9F7C
_080D2E16:
	ldr r0, _080D2E40 @ =0x08BABAF4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2E3C: .4byte 0x000030E0
_080D2E40: .4byte 0x08BABAF4

