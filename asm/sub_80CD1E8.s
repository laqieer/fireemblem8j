	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CC0F0, 0x080CC0F0 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CD1E8, "ax", %progbits
@ sub_80CD1E8 @ JP 0x080CD1E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD1E8
	.thumb_func
sub_80CD1E8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #8
	movs r1, #0x88
	bl sub_80CC590
	ldr r3, _080CD228 @ =0x08B3F1F0
	ldr r0, _080CD22C @ =0x000020A0
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x78
	bl PutSpriteExt
	ldr r3, _080CD230 @ =0x08B3F204
	movs r0, #0x83
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
	ldrh r0, [r5, #0x2a]
	cmp r0, #1
	beq _080CD24C
	cmp r0, #1
	bgt _080CD234
	cmp r0, #0
	beq _080CD23A
	b _080CD26E
	.align 2, 0
_080CD228: .4byte 0x08B3F1F0
_080CD22C: .4byte 0x000020A0
_080CD230: .4byte 0x08B3F204
_080CD234:
	cmp r0, #2
	beq _080CD25E
	b _080CD26E
_080CD23A:
	movs r4, #0
_080CD23C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80CC0F0
	adds r4, #1
	cmp r4, #7
	ble _080CD23C
	b _080CD26E
_080CD24C:
	movs r4, #8
_080CD24E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80CC0F0
	adds r4, #1
	cmp r4, #0xf
	ble _080CD24E
	b _080CD26E
_080CD25E:
	movs r4, #0x10
_080CD260:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80CC0F0
	adds r4, #1
	cmp r4, #0x15
	ble _080CD260
_080CD26E:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x38
	bne _080CD2D4
	movs r0, #0
	strh r0, [r5, #0x2a]
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x36]
	ldr r2, _080CD2C8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r6, _080CD2CC @ =0x00007FFF
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r3, r0, #0
	ldr r2, _080CD2D0 @ =0x02023CA8
	movs r7, #0
	movs r4, #0xa0
	lsls r4, r4, #2
_080CD2AC:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bne _080CD2AC
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CD2D8
	.align 2, 0
_080CD2C8: .4byte 0x03003020
_080CD2CC: .4byte 0x00007FFF
_080CD2D0: .4byte 0x02023CA8
_080CD2D4:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CD2D8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

