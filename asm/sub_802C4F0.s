	.syntax unified
	.set sub_802B970, 0x0802B970 + 1
	.set sub_802C570, 0x0802C570 + 1
	.section .text.sub_802C4F0, "ax", %progbits
@ sub_802C4F0 @ JP 0x0802C4F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C4F0
	.thumb_func
sub_802C4F0:
	push {r4, lr}
	ldr r0, _0802C53C @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C56A
	ldr r4, _0802C540 @ =0x0203A4E8
	ldr r0, [r4, #0x4c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802C544
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C520
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802C520:
	adds r0, r4, #0
	bl sub_802C570
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4, #9]
	adds r1, r1, r0
	strb r1, [r4, #9]
	adds r0, r4, #0
	bl sub_802B970
	b _0802C56A
	.align 2, 0
_0802C53C: .4byte 0x0202BCEC
_0802C540: .4byte 0x0203A4E8
_0802C544:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0802C56A
	ldrb r1, [r4, #9]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0802C56A
	adds r2, r4, #0
	adds r2, #0x6e
	movs r0, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x14
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl sub_802B970
_0802C56A:
	pop {r4}
	pop {r0}
	bx r0

