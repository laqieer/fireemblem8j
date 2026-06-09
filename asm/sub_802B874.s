	.syntax unified
	.set sub_802B970, 0x0802B970 + 1
	.set sub_802C46C, 0x0802C46C + 1
	.section .text.sub_802B874, "ax", %progbits
@ sub_802B874 @ JP 0x0802B874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B874
	.thumb_func
sub_802B874:
	push {r4, r5, r6, lr}
	ldr r5, _0802B8DC @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802B892
	ldr r0, _0802B8E0 @ =0x0203A568
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _0802B8D6
_0802B892:
	ldr r0, _0802B8E4 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802B8D6
	ldr r4, _0802B8E0 @ =0x0203A568
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802C46C
	adds r6, r5, #0
	adds r6, #0x6e
	strb r0, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802C46C
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r6]
	ldrb r2, [r5, #9]
	adds r1, r1, r2
	strb r1, [r5, #9]
	ldrb r1, [r4, #9]
	adds r1, r1, r0
	strb r1, [r4, #9]
	adds r0, r5, #0
	bl sub_802B970
	adds r0, r4, #0
	bl sub_802B970
_0802B8D6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B8DC: .4byte 0x0203A4E8
_0802B8E0: .4byte 0x0203A568
_0802B8E4: .4byte 0x0202BCEC

