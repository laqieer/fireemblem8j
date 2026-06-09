	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A3B70, "ax", %progbits
@ sub_80A3B70 @ JP 0x080A3B70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3B70
	.thumb_func
sub_80A3B70:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r2, _080A3BBC @ =0x085775CC
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A3BC4
	ldr r0, _080A3BC0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3BA0
	movs r0, #0x6b
	bl m4aSongNumStart
_080A3BA0:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl ChangeBgm
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A3C5C
	.align 2, 0
_080A3BBC: .4byte 0x085775CC
_080A3BC0: .4byte 0x0202BCEC
_080A3BC4:
	ldrh r1, [r3, #4]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080A3C10
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	adds r3, r0, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3C16
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _080A3C16
	ldr r0, _080A3C0C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3C00
	movs r0, #0x6a
	bl m4aSongNumStart
_080A3C00:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080A3C5C
	.align 2, 0
_080A3C0C: .4byte 0x0202BCEC
_080A3C10:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_080A3C16:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x4f
	cmp r0, #0
	beq _080A3C2C
	movs r0, #0xff
	strb r0, [r3]
_080A3C2C:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x88
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A3C3E
	movs r0, #1
	strb r0, [r3]
_080A3C3E:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080A3C54
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A3C5C
_080A3C54:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A3C5C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

