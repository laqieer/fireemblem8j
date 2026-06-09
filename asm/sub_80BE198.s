	.syntax unified
	.set GetGmPathLength, 0x080C20A8 + 1
	.set GetGmSkirmishUnitAtNode, 0x080C185C + 1
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C1B20, 0x080C1B20 + 1
	.section .text.sub_80BE198, "ax", %progbits
@ sub_80BE198 @ JP 0x080BE198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE198
	.thumb_func
sub_80BE198:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r7, _080BE1D4 @ =0x03005270
	ldrb r0, [r7, #0x11]
	cmp r0, r4
	bne _080BE21E
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BE20C
	lsls r0, r4, #5
	ldr r1, _080BE1D8 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080BE20C
	adds r0, r4, #0
	bl GetGmSkirmishUnitAtNode
	cmp r0, #0
	blt _080BE1DC
	adds r0, r5, #0
	movs r1, #0x10
	b _080BE216
	.align 2, 0
_080BE1D4: .4byte 0x03005270
_080BE1D8: .4byte 0x081F5D7C
_080BE1DC:
	adds r0, r7, #0
	bl GetNextUnclearedNode
	adds r3, r0, #0
	ldr r2, _080BE208 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080BE200
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080BE200
	cmp r3, #2
	beq _080BE29E
_080BE200:
	adds r0, r5, #0
	movs r1, #0x12
	b _080BE216
	.align 2, 0
_080BE208: .4byte 0x0202BCEC
_080BE20C:
	adds r0, r5, #0
	adds r0, #0x3e
	strb r4, [r0]
	adds r0, r5, #0
	movs r1, #0xe
_080BE216:
	bl Proc_Goto
_080BE21A:
	movs r0, #1
	b _080BE2A0
_080BE21E:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	lsls r1, r4, #0x18
	asrs r6, r1, #0x18
	adds r1, r6, #0
	movs r2, #0
	bl sub_80C1B20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BE252
	bl GetGmPathLength
	adds r1, r0, #0
	cmp r1, #2
	bne _080BE24C
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080BE20C
_080BE24C:
	adds r0, r5, #0
	movs r1, #6
	b _080BE216
_080BE252:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	adds r1, r6, #0
	movs r2, #1
	bl sub_80C1B20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BE29E
	bl GetGmPathLength
	adds r2, r0, #0
	cmp r2, #2
	bne _080BE294
	lsls r0, r4, #5
	ldr r1, _080BE290 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080BE288
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0
	bne _080BE20C
_080BE288:
	adds r0, r5, #0
	movs r1, #6
	b _080BE216
	.align 2, 0
_080BE290: .4byte 0x081F5D7C
_080BE294:
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _080BE21A
_080BE29E:
	movs r0, #0
_080BE2A0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

