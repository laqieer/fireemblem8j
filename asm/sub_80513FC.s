	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set EkrGauge_Setup44, 0x08051EF4 + 1
	.set EkrModifyBarfx, 0x08073644 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80513FC, "ax", %progbits
@ sub_80513FC @ JP 0x080513FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80513FC
	.thumb_func
sub_80513FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, _08051500 @ =0x02019490
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r7, _08051504 @ =0x03003020
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r6, r7, #0
	adds r6, #0x34
	ldrb r1, [r6]
	movs r2, #1
	mov r8, r2
	mov r0, r8
	orrs r1, r0
	movs r2, #2
	mov sb, r2
	mov r0, sb
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	adds r2, r2, r7
	mov ip, r2
	ldrb r0, [r2]
	mov r2, r8
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	strb r1, [r6]
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08051508 @ =0x0885729C
	ldr r1, _0805150C @ =0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterDataMove
	ldr r0, _08051510 @ =0x08857A7C
	ldr r1, _08051514 @ =0x020238F4
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl EfxTmCpyBG
	ldr r0, _08051518 @ =0x08857AE8
	ldr r1, _0805151C @ =0x020228C8
	movs r2, #8
	bl sub_80D636C
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	bl GetBanimDragonStatusType
	cmp r0, #2
	bhi _08051520
	cmp r0, #1
	blo _08051520
	ldrb r2, [r7, #0x10]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0x10]
	ldrb r2, [r7, #0xc]
	adds r0, r1, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x18]
	ands r1, r0
	mov r0, sb
	orrs r1, r0
	strb r1, [r7, #0x18]
	ldrb r0, [r7, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x14]
	b _0805154C
	.align 2, 0
_08051500: .4byte 0x02019490
_08051504: .4byte 0x03003020
_08051508: .4byte 0x0885729C
_0805150C: .4byte 0x06002000
_08051510: .4byte 0x08857A7C
_08051514: .4byte 0x020238F4
_08051518: .4byte 0x08857AE8
_0805151C: .4byte 0x020228C8
_08051520:
	ldr r3, _08051564 @ =0x03003020
	ldrb r2, [r3, #0x10]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0xc]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_0805154C:
	movs r0, #1
	bl EkrGauge_Setup44
	ldr r0, _08051568 @ =0x0203E1C4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08051570
	ldr r0, _0805156C @ =0x0203E1C0
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _08051576
	.align 2, 0
_08051564: .4byte 0x03003020
_08051568: .4byte 0x0203E1C4
_0805156C: .4byte 0x0203E1C0
_08051570:
	ldr r0, _0805160C @ =0x0203E1C0
	movs r1, #2
	ldrsh r0, [r0, r1]
_08051576:
	movs r1, #0x64
	bl sub_80D637C
	adds r6, r0, #0
	movs r1, #0xa
	bl sub_80D6374
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne _08051594
	movs r5, #0xa
_08051594:
	ldr r0, _08051610 @ =0x02019490
	adds r1, r6, #0
	bl EkrModifyBarfx
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov sb, r4
	mov r5, sl
	ldr r4, _08051610 @ =0x02019490
	ldr r7, _08051614 @ =0x0885761C
	movs r6, #0xc
_080515AC:
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl sub_80D636C
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080515AC
	ldr r4, _08051618 @ =0x0885791C
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl sub_80D636C
	add r4, sb
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r1, _0805161C @ =0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterDataMove
	movs r0, #0
	ldr r1, [sp, #8]
	strh r0, [r1, #0x2c]
	ldr r0, _08051620 @ =ekrBattle_4
	str r0, [r1, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805160C: .4byte 0x0203E1C0
_08051610: .4byte 0x02019490
_08051614: .4byte 0x0885761C
_08051618: .4byte 0x0885791C
_0805161C: .4byte 0x060021A0
_08051620: .4byte 0x08051625  @ ekrBattle_4

