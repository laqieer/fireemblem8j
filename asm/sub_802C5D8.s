	.syntax unified
	.set CanBattleUnitGainLevels, 0x0802B93C + 1
	.set sub_802B970, 0x0802B970 + 1
	.section .text.sub_802C5D8, "ax", %progbits
@ sub_802C5D8 @ JP 0x0802C5D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C5D8
	.thumb_func
sub_802C5D8:
	push {r4, lr}
	ldr r4, _0802C61C @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C614
	adds r0, r4, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C614
	ldr r0, _0802C620 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C614
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r4, #9]
	adds r0, #0xa
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl sub_802B970
_0802C614:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C61C: .4byte 0x0203A4E8
_0802C620: .4byte 0x0202BCEC

