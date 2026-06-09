	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80C3FFC, 0x080C3FFC + 1
	.set sub_80C4080, 0x080C4080 + 1
	.section .text.sub_80BE2A8, "ax", %progbits
@ sub_80BE2A8 @ JP 0x080BE2A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE2A8
	.thumb_func
sub_80BE2A8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080BE2D0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BE2D4
	movs r0, #2
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	adds r6, r1, #0
	b _080BE2DC
	.align 2, 0
_080BE2D0: .4byte 0x085775CC
_080BE2D4:
	movs r0, #4
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x2a
_080BE2DC:
	adds r5, r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080BE2EE
	subs r0, r1, #1
	strb r0, [r5]
	b _080BE3E6
_080BE2EE:
	bl sub_80C4080
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BE3E6
	ldr r0, _080BE310 @ =0x085775CC
	ldr r2, [r0]
	ldrh r3, [r2, #4]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080BE314
	movs r2, #0xf0
	ands r2, r3
	movs r0, #0xa
	strb r0, [r5]
	b _080BE332
	.align 2, 0
_080BE310: .4byte 0x085775CC
_080BE314:
	ldrh r0, [r2, #8]
	movs r4, #0xf0
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _080BE32C
	movs r0, #0xa
	strb r0, [r5]
	ldrh r0, [r2, #8]
	adds r2, r4, #0
	ands r2, r0
	b _080BE332
_080BE32C:
	adds r2, r4, #0
	ands r2, r3
	strb r1, [r6]
_080BE332:
	cmp r2, #0
	beq _080BE3E6
	ldr r1, _080BE364 @ =0x03005270
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080BE342
	adds r0, #0xf
_080BE342:
	lsls r0, r0, #0xc
	asrs r3, r0, #0x10
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080BE350
	adds r0, #0xf
_080BE350:
	lsls r0, r0, #0xc
	asrs r1, r0, #0x10
	adds r4, r3, #0
	adds r5, r1, #0
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080BE368
	adds r0, r4, #1
	b _080BE372
	.align 2, 0
_080BE364: .4byte 0x03005270
_080BE368:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080BE376
	subs r0, r4, #1
_080BE372:
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_080BE376:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080BE382
	adds r0, r5, #1
	b _080BE38C
_080BE382:
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _080BE390
	subs r0, r5, #1
_080BE38C:
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_080BE390:
	cmp r4, #0
	bgt _080BE398
	movs r4, #1
	b _080BE39E
_080BE398:
	cmp r4, #0x1c
	ble _080BE39E
	movs r4, #0x1c
_080BE39E:
	cmp r5, #0
	bgt _080BE3A6
	movs r5, #1
	b _080BE3AC
_080BE3A6:
	cmp r5, #0x12
	ble _080BE3AC
	movs r5, #0x12
_080BE3AC:
	cmp r3, r4
	bne _080BE3B4
	cmp r1, r5
	beq _080BE3E6
_080BE3B4:
	ldr r0, _080BE3F4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BE3C6
	movs r0, #0x65
	bl m4aSongNumStart
_080BE3C6:
	lsls r0, r4, #4
	adds r0, #8
	lsls r0, r0, #0x10
	lsls r1, r5, #4
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #4]
	str r7, [sp]
	movs r0, #0
	add r1, sp, #4
	mov r2, r8
	movs r3, #0
	bl sub_80C3FFC
_080BE3E6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE3F4: .4byte 0x0202BCEC

