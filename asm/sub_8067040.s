	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEkrDragonStatusType, 0x0807201C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067040, "ax", %progbits
@ sub_8067040 @ JP 0x08067040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067040
	.thumb_func
sub_8067040:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r1, _080670C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080670C8 @ =0x08601A10
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	str r0, [r5, #0x44]
	ldr r0, _080670CC @ =0x080E35F6
	str r0, [r5, #0x48]
	ldr r4, _080670D0 @ =0x087792E8
	str r4, [r5, #0x4c]
	ldr r0, _080670D4 @ =0x087778F0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	subs r4, #0x20
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r5, #0x5c]
	ldr r2, _080670D8 @ =0x08779308
	adds r1, r2, #0
	bl sub_805660C
	ldr r0, _080670DC @ =0x02000000
	ldr r0, [r0]
	bl GetEkrDragonStatusType
	cmp r0, #0
	bne _080670E4
	ldr r3, _080670E0 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	b _08067110
	.align 2, 0
_080670C4: .4byte 0x0201774C
_080670C8: .4byte 0x08601A10
_080670CC: .4byte 0x080E35F6
_080670D0: .4byte 0x087792E8
_080670D4: .4byte 0x087778F0
_080670D8: .4byte 0x08779308
_080670DC: .4byte 0x02000000
_080670E0: .4byte 0x03003020
_080670E4:
	ldr r3, _08067154 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x18]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
_08067110:
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	ldrh r2, [r7, #8]
	ldr r6, _08067158 @ =0x0000F3FF
	adds r1, r6, #0
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r2, #0
	orrs r1, r5
	strh r1, [r7, #8]
	ldrh r2, [r0, #8]
	adds r1, r6, #0
	ands r1, r2
	orrs r1, r5
	strh r1, [r0, #8]
	ldr r4, _0806715C @ =0x02000010
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _0806714C
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r2, #8]
_0806714C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067154: .4byte 0x03003020
_08067158: .4byte 0x0000F3FF
_0806715C: .4byte 0x02000010

