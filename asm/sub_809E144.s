	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_809E144, "ax", %progbits
@ sub_809E144 @ JP 0x0809E144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809E144
	.thumb_func
sub_809E144:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _0809E170 @ =0x085775CC
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809E186
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809E174
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809E1B2
	.align 2, 0
_0809E170: .4byte 0x085775CC
_0809E174:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E1CC
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809E1B2
_0809E186:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E1CC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809E1A4
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809E1B2
_0809E1A4:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E1CC
	str r6, [r4, #0x30]
_0809E1B2:
	ldr r0, _0809E1C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E1C4
	movs r0, #0x66
	bl m4aSongNumStart
_0809E1C4:
	movs r0, #1
	b _0809E1CE
	.align 2, 0
_0809E1C8: .4byte 0x0202BCEC
_0809E1CC:
	movs r0, #0
_0809E1CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

