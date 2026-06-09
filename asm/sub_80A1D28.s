	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A1D28, "ax", %progbits
@ sub_80A1D28 @ JP 0x080A1D28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1D28
	.thumb_func
sub_80A1D28:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r1, #0
	cmp r5, #5
	bne _080A1D46
	movs r5, #4
	b _080A1D4E
_080A1D46:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A1D4E
	subs r5, #1
_080A1D4E:
	cmp r1, #0
	beq _080A1DCC
	ldr r2, _080A1D74 @ =0x085775CC
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x30
	cmp r0, #0
	beq _080A1D84
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A1D78
	subs r0, #1
	strb r0, [r3]
	b _080A1D84
	.align 2, 0
_080A1D74: .4byte 0x085775CC
_080A1D78:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A1D84
	strb r5, [r3]
_080A1D84:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080A1DAA
	ldrb r0, [r3]
	cmp r0, r5
	bge _080A1D9C
	adds r0, #1
	b _080A1DA8
_080A1D9C:
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080A1DAA
	movs r0, #0
_080A1DA8:
	strb r0, [r3]
_080A1DAA:
	ldrb r3, [r3]
	cmp ip, r3
	beq _080A1DCC
	ldr r0, _080A1DC8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1DC2
	movs r0, #0x66
	bl m4aSongNumStart
_080A1DC2:
	movs r0, #1
	b _080A1DCE
	.align 2, 0
_080A1DC8: .4byte 0x0202BCEC
_080A1DCC:
	movs r0, #0
_080A1DCE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

