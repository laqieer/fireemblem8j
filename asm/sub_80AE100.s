	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set SaveMenuGetBitfile, 0x080AD25C + 1
	.set SaveMenuHasOptions, 0x080B054C + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_808B894, 0x0808B894 + 1
	.set sub_80B0354, 0x080B0354 + 1
	.set sub_80B0444, 0x080B0444 + 1
	.set sub_80B06C8, 0x080B06C8 + 1
	.set sub_80B083C, 0x080B083C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80AE100, "ax", %progbits
@ sub_80AE100 @ JP 0x080AE100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE100
	.thumb_func
sub_80AE100:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080AE178
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_80B06C8
	movs r0, #4
	adds r1, r7, #0
	bl sub_80B06C8
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080AE154
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080AE150 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl sub_808B894
	b _080AE16A
	.align 2, 0
_080AE150: .4byte 0x0001FFFF
_080AE154:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080AE174 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808B894
_080AE16A:
	ldrb r0, [r4]
	bl sub_80B083C
	b _080AE23C
	.align 2, 0
_080AE174: .4byte 0x0001FFFF
_080AE178:
	cmp r0, #0x20
	bne _080AE1EE
	adds r0, r7, #0
	bl sub_80B0354
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080AE1A2
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080AE23C
_080AE1A2:
	cmp r0, #0x40
	bne _080AE1B0
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080AE23C
_080AE1B0:
	adds r0, r7, #0
	bl SaveMenuHasOptions
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE23C
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080AE1D4
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080AE1E4
_080AE1D4:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl sub_80B0444
	strb r0, [r4]
_080AE1E4:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080AE23C
_080AE1EE:
	cmp r0, #0x30
	bne _080AE23C
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl SaveMenuGetBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080AE238 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE22E
	movs r0, #0x6b
	bl m4aSongNumStart
_080AE22E:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080AE3C0
	.align 2, 0
_080AE238: .4byte 0x0202BCEC
_080AE23C:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080AE2B4
	ldr r4, _080AE2B0 @ =0x080DC15C
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080AE32C
	.align 2, 0
_080AE2B0: .4byte 0x080DC15C
_080AE2B4:
	cmp r1, #7
	bhi _080AE33C
	ldr r4, _080AE338 @ =0x080DC15C
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl sub_80D6374
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, r6, r1
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080AE32C:
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	b _080AE3B8
	.align 2, 0
_080AE338: .4byte 0x080DC15C
_080AE33C:
	cmp r1, #0xf
	bhi _080AE3B8
	ldr r4, _080AE3D0 @ =0x080DC15C
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, #0xe0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, #0xe0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
_080AE3B8:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080AE3C0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3D0: .4byte 0x080DC15C

