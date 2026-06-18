	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B3804, 0x080B3804 + 1
	.set sub_80B5E00, 0x080B5E00 + 1
	.section .text.sub_80B5EA4, "ax", %progbits
@ BonusClaim_Loop_SelectTargetKeyHandler @ JP 0x080B5EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BonusClaim_Loop_SelectTargetKeyHandler
	.thumb_func
BonusClaim_Loop_SelectTargetKeyHandler:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080B5ED4 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B5EEC
	adds r0, r5, #0
	bl sub_80B5E00
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B5ED8
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B5F64
	.align 2, 0
_080B5ED4: .4byte 0x085775CC
_080B5ED8:
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080B5EE8 @ =0x0000082D
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80B3804
	b _080B5F64
	.align 2, 0
_080B5EE8: .4byte 0x0000082D
_080B5EEC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B5F14
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _080B5F10 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B5F64
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B5F64
	.align 2, 0
_080B5F10: .4byte 0x0202BCEC
_080B5F14:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B5F20
	subs r4, #1
_080B5F20:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B5F2A
	adds r4, #1
_080B5F2A:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080B5F64
	cmp r4, #0
	blt _080B5F64
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080B5F64
	ldr r0, _080B5F6C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B5F50
	movs r0, #0x66
	bl m4aSongNumStart
_080B5F50:
	strb r4, [r6]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x70
	movs r2, #9
	bl sub_80B1FBC
_080B5F64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5F6C: .4byte 0x0202BCEC

