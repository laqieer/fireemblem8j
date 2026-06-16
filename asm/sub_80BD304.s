	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetWMFaceBg, 0x080BD158 + 1
	.set GetWMFaceVramOffset, 0x080BD174 + 1
	.set SetFaceDisplayBits, 0x08005678 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80056AC, 0x080056AC + 1
	.set PutWMFaceOnBg, 0x080BD194 + 1
	.section .text.sub_80BD304, "ax", %progbits
@ sub_80BD304 @ JP 0x080BD304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD304
	.thumb_func
sub_80BD304:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, [r0, #0x2c]
	str r0, [sp, #8]
	bl GetWMFaceBg
	mov sl, r0
	ldr r0, [sp, #8]
	adds r0, #0x2e
	mov sb, r0
	ldr r1, [sp, #8]
	adds r1, #0x2c
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #1
	str r3, [sp, #4]
_080BD32E:
	movs r7, #0
	ldr r0, [sp, #8]
	adds r0, #0x30
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _080BD340
	b _080BD4CA
_080BD340:
	adds r6, r0, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	ldrsh r4, [r2, r3]
	mov r5, sb
	ldrh r2, [r5]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080BD3D4
	movs r1, #0xff
	ands r1, r2
	cmp r1, #0xf
	bhi _080BD3D4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _080BD382
	movs r0, #0x10
	subs r0, r0, r1
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080BD37A
	adds r0, #0xff
_080BD37A:
	asrs r0, r0, #8
	adds r0, r4, r0
	strh r0, [r6, #0x34]
	movs r7, #1
_080BD382:
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD3AA
	movs r0, #0xff
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080BD3A2
	adds r0, #0xff
_080BD3A2:
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r6, #0x34]
	movs r7, #1
_080BD3AA:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r3, #0xff
	ands r0, r3
	cmp r0, #0xf
	bls _080BD3D4
	movs r7, #2
	adds r0, r6, #0
	bl sub_80056AC
	ldr r1, _080BD474 @ =0xFFFFBFFF
	ands r1, r0
	adds r0, r6, #0
	bl SetFaceDisplayBits
	ldrh r0, [r5]
	ldr r2, _080BD478 @ =0x0000F7FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
_080BD3D4:
	ldrh r1, [r5]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD46A
	movs r0, #0xff
	mov r8, r0
	ands r0, r1
	cmp r0, #0xf
	bhi _080BD46A
	cmp r0, #0
	bne _080BD402
	adds r0, r6, #0
	bl sub_80056AC
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r1, r0
	adds r0, r6, #0
	bl SetFaceDisplayBits
_080BD402:
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD42E
	adds r2, r4, #0
	subs r2, #0x20
	mov r0, r8
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080BD426
	adds r0, #0xff
_080BD426:
	asrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r6, #0x34]
	movs r7, #1
_080BD42E:
	ldrh r1, [r5]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD45A
	adds r2, r4, #0
	adds r2, #0x20
	movs r0, #0xff
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080BD452
	adds r0, #0xff
_080BD452:
	asrs r0, r0, #8
	subs r0, r2, r0
	strh r0, [r6, #0x34]
	movs r7, #1
_080BD45A:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xf
	bls _080BD46A
	movs r7, #2
_080BD46A:
	cmp r7, #1
	beq _080BD47C
	cmp r7, #2
	beq _080BD4B4
	b _080BD4CA
	.align 2, 0
_080BD474: .4byte 0xFFFFBFFF
_080BD478: .4byte 0x0000F7FF
_080BD47C:
	mov r0, sl
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	bl GetWMFaceBg
	adds r4, r0, #0
	bl GetWMFaceVramOffset
	adds r1, r0, #0
	movs r3, #0x34
	ldrsh r2, [r6, r3]
	ldrh r0, [r5]
	lsrs r0, r0, #0xa
	ands r0, r7
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #0x1c
	bl PutWMFaceOnBg
	mov r0, sl
	lsls r7, r0
	adds r0, r7, #0
	bl BG_EnableSyncByMask
	b _080BD4CA
_080BD4B4:
	mov r0, sl
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	mov r1, sl
	lsls r0, r1
	bl BG_EnableSyncByMask
_080BD4CA:
	movs r2, #0xc
	add sb, r2
	ldr r3, [sp, #0xc]
	adds r3, #0xc
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r1, [sp, #4]
	subs r1, #1
	str r1, [sp, #4]
	cmp r1, #0
	blt _080BD4E6
	b _080BD32E
_080BD4E6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

