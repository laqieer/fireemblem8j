	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set InitTargets, 0x08050618 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set sub_801DA28, 0x0801DA28 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_801856C, "ax", %progbits
@ sub_801856C @ JP 0x0801856C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801856C
	.thumb_func
sub_801856C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	movs r1, #0
	bl InitTargets
	ldr r0, _08018588 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	adds r6, r0, #1
	b _08018636
	.align 2, 0
_08018588: .4byte 0x0202BCEC
_0801858C:
	ldr r1, _08018664 @ =0x085C2A50
	movs r0, #0xff
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	cmp r4, #0
	beq _08018630
	ldr r0, [r4]
	cmp r0, #0
	beq _08018630
	ldr r0, [r4, #0xc]
	ldr r1, _08018668 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08018630
	adds r3, r4, #0
	adds r3, #0x31
	ldrb r2, [r3]
	movs r7, #0xf0
	mov ip, r7
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _080185CE
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080185CE:
	ldrb r2, [r3]
	movs r1, #0xf
	movs r0, #0xf
	mov sb, r0
	ands r0, r2
	cmp r0, #0
	beq _080185F4
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	ands r0, r1
	movs r7, #0x10
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	movs r0, #1
	mov r8, r0
_080185F4:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	mov r0, ip
	ands r0, r3
	cmp r0, #0
	beq _08018630
	mov r2, sb
	ands r2, r3
	cmp r2, #0xa
	beq _08018614
	lsrs r0, r3, #4
	subs r0, #1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r1]
_08018614:
	ldrb r1, [r1]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _08018630
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_08018630:
	adds r6, #1
	ldr r0, _0801866C @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
_08018636:
	adds r0, #0x40
	cmp r6, r0
	blt _0801858C
	mov r7, r8
	cmp r7, #0
	beq _08018658
	bl sub_8019994
	bl RefreshEntityBmMaps
	bl sub_8019914
	movs r0, #1
	bl sub_801DA28
	bl sub_8027144
_08018658:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018664: .4byte 0x085C2A50
_08018668: .4byte 0x0001002C
_0801866C: .4byte 0x0202BCEC

