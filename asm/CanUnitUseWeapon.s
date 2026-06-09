	.syntax unified
	.set IsItemUnsealedForUnit, 0x08017254 + 1
	.section .text.CanUnitUseWeapon, "ax", %progbits
@ CanUnitUseWeapon @ JP 0x0801631C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitUseWeapon
	.thumb_func
CanUnitUseWeapon:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _08016328
	b _080164BE
_08016328:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016478 @ =0x0885E068
	adds r0, r0, r1
	ldr r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	bne _08016344
	b _080164BE
_08016344:
	ldr r0, _0801647C @ =0x003D3C00
	ands r0, r2
	cmp r0, #0
	bne _0801634E
	b _08016498
_0801634E:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _0801636E
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _0801636E
	b _080164BE
_0801636E:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0801639C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _0801639C
	b _080164BE
_0801639C:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080163C8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _080164BE
_080163C8:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080163F4
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _080164BE
_080163F4:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _0801641A
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	cmp r0, #0
	bge _080164BE
_0801641A:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08016446
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080164BE
_08016446:
	movs r0, #0xff
	ands r0, r5
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016480
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080164BE
	movs r0, #1
	b _080164F0
	.align 2, 0
_08016478: .4byte 0x0885E068
_0801647C: .4byte 0x003D3C00
_08016480:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r1, r0
	cmp r1, #0
	beq _08016498
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsItemUnsealedForUnit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080164BE
_08016498:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	ldr r3, _080164C4 @ =0x0885E068
	cmp r0, #3
	bne _080164C8
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080164C8
_080164BE:
	movs r0, #0
	b _080164F0
	.align 2, 0
_080164C4: .4byte 0x0885E068
_080164C8:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #0x1c]
	movs r1, #0xff
	cmp r5, #0
	beq _080164DE
	ldrb r1, [r0, #7]
_080164DE:
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, r2
	blt _080164EE
	movs r1, #1
_080164EE:
	adds r0, r1, #0
_080164F0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

