	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8017178, "ax", %progbits
@ sub_8017178 @ JP 0x08017178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8017178
	.thumb_func
sub_8017178:
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #1
_0801717E:
	adds r0, r4, #0
	bl GetUnit
	mov ip, r0
	adds r6, r4, #1
	cmp r0, #0
	beq _080171E8
	ldr r0, [r0]
	cmp r0, #0
	beq _080171E8
	mov r1, ip
	ldr r0, [r1, #0xc]
	ldr r1, _080171C4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080171E8
	movs r4, #0
	mov r0, ip
	ldrh r3, [r0, #0x1e]
	cmp r3, #0
	beq _080171E8
	ldr r7, _080171C8 @ =0x0885E068
_080171AA:
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r7
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080171CC
	ldrh r0, [r2, #0x1a]
	b _080171D2
	.align 2, 0
_080171C4: .4byte 0x00010004
_080171C8: .4byte 0x0885E068
_080171CC:
	asrs r1, r3, #8
	ldrh r0, [r2, #0x1a]
	muls r0, r1, r0
_080171D2:
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #4
	bgt _080171E8
	lsls r1, r4, #1
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0
	bne _080171AA
_080171E8:
	adds r4, r6, #0
	cmp r4, #0x3f
	ble _0801717E
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

