	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.section .text.sub_803A8F0, "ax", %progbits
@ sub_803A8F0 @ JP 0x0803A8F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A8F0
	.thumb_func
sub_803A8F0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, _0803A980 @ =0x03004DF0
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r0, _0803A984 @ =0x0000FFFF
	strh r0, [r6]
	movs r4, #1
_0803A91C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803A96C
	ldr r0, [r2]
	cmp r0, #0
	beq _0803A96C
	ldr r0, [r2, #0xc]
	ldr r1, _0803A988 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803A96C
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _0803A98C @ =0x0202E4E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x10
	ldrsb r3, [r2, r3]
	ldr r0, [r1]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803A96C
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _0803A96C
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r7, r0
	blt _0803A96C
	ldrb r7, [r1]
	strh r3, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r6, #2]
_0803A96C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803A91C
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0803A990
	movs r0, #0
	b _0803A992
	.align 2, 0
_0803A980: .4byte 0x03004DF0
_0803A984: .4byte 0x0000FFFF
_0803A988: .4byte 0x00010025
_0803A98C: .4byte 0x0202E4E0
_0803A990:
	movs r0, #1
_0803A992:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

