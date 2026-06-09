	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8030C10, 0x08030C10 + 1
	.set sub_80A9740, 0x080A9740 + 1
	.section .text.sub_8089268, "ax", %progbits
@ sub_8089268 @ JP 0x08089268 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089268
	.thumb_func
sub_8089268:
	push {r4, r5, r6, lr}
	ldr r5, _08089338 @ =0x02003BFC
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A9740
	adds r6, r0, #0
	cmp r6, #0
	beq _08089330
	ldr r0, _0808933C @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08089330
	ldr r0, _08089340 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08089330
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08089330
	bl sub_8030C10
	cmp r0, #1
	beq _08089330
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08089330
	movs r0, #0x94
	lsls r0, r0, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r0, _08089344 @ =0x000004CC
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #3
	bl sub_80043B8
	ldr r0, _08089348 @ =0x000004CD
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #3
	bl sub_80043B8
	ldr r0, _0808934C @ =0x000004CE
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x58
	movs r2, #3
	bl sub_80043B8
	ldr r4, _08089350 @ =0x020040B2
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	adds r0, r4, #4
	ldrh r2, [r6, #0xc]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x14
	movs r1, #2
	bl PutNumber
	adds r0, r4, #0
	adds r0, #0xc
	ldrb r3, [r6, #0xb]
	ldrb r2, [r6, #0xc]
	movs r1, #3
	ands r2, r1
	lsls r2, r2, #8
	orrs r2, r3
	movs r1, #2
	bl PutNumber
	adds r4, #0x14
	ldrb r2, [r6]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
_08089330:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089338: .4byte 0x02003BFC
_0808933C: .4byte 0x0202BCAC
_08089340: .4byte 0x0202BCEC
_08089344: .4byte 0x000004CC
_08089348: .4byte 0x000004CD
_0808934C: .4byte 0x000004CE
_08089350: .4byte 0x020040B2

