	.syntax unified
	.set InitTalkTextWin, 0x08008360 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8006E90, 0x08006E90 + 1
	.set sub_80082DC, 0x080082DC + 1
	.set sub_80083DC, 0x080083DC + 1
	.set sub_8008564, 0x08008564 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.set sub_8050B14, 0x08050B14 + 1
	.section .text.sub_80081A0, "ax", %progbits
@ sub_80081A0 @ JP 0x080081A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80081A0
	.thumb_func
sub_80081A0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	mov sl, r1
	adds r4, r2, #0
	str r3, [sp, #4]
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldr r0, _080081F0 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r7, #1
	cmp r5, #0xf
	bgt _080081CA
	movs r7, #0
_080081CA:
	bl sub_8050B14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080081D6
	adds r7, #2
_080081D6:
	mov r1, sl
	ldr r2, [sp, #4]
	subs r0, r1, r2
	adds r0, #1
	mov sb, r0
	cmp r7, #1
	beq _08008212
	cmp r7, #1
	bgt _080081F4
	cmp r7, #0
	beq _080081FE
	b _08008256
	.align 2, 0
_080081F0: .4byte 0x020234A8
_080081F4:
	cmp r7, #2
	beq _08008236
	cmp r7, #3
	beq _08008248
	b _08008256
_080081FE:
	adds r5, #3
	mov r8, r5
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r6, r5, r0
	cmp r6, #0
	bgt _08008256
	movs r6, #1
	b _08008256
_08008212:
	subs r5, #5
	mov r8, r5
	adds r0, r4, #1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, r8
	cmp r0, #0x1d
	ble _0800822A
	movs r0, #0x1d
	subs r6, r0, r4
	b _08008256
_0800822A:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r1, r8
	subs r6, r1, r0
	b _08008256
_08008236:
	movs r6, #9
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	movs r0, #8
	mov r8, r0
	movs r1, #0x10
	mov sl, r1
	b _08008256
_08008248:
	movs r6, #1
	movs r2, #0xe
	mov sb, r2
	movs r4, #0x14
	mov r8, r4
	movs r0, #0x10
	mov sl, r0
_08008256:
	ldr r5, _080082D8 @ =0x085B90D4
	ldr r1, [r5]
	adds r0, r6, #1
	strb r0, [r1, #0xc]
	ldr r1, [r5]
	mov r0, sb
	adds r0, #1
	strb r0, [r1, #0xd]
	ldr r1, [sp, #4]
	str r1, [sp]
	movs r0, #1
	adds r1, r6, #0
	mov r2, sb
	adds r3, r4, #0
	bl sub_8008564
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08008298
	movs r0, #1
	ands r0, r1
	bl sub_8006E90
	ldr r1, [r5]
	adds r1, #0x83
	ldrb r0, [r1]
	movs r2, #2
	eors r0, r2
	strb r0, [r1]
_08008298:
	ldr r0, [r5]
	adds r0, #0x83
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080082B2
	movs r0, #1
	mov r1, r8
	mov r2, sl
	adds r3, r7, #0
	bl sub_80083DC
_080082B2:
	adds r0, r6, #0
	mov r1, sb
	adds r2, r4, #0
	ldr r3, [sp, #4]
	bl InitTalkTextWin
	bl sub_80082DC
	movs r0, #2
	bl sub_8008E10
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080082D8: .4byte 0x085B90D4

