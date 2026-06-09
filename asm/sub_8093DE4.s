	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8089094, 0x08089094 + 1
	.set sub_8092638, 0x08092638 + 1
	.set sub_8093744, 0x08093744 + 1
	.set sub_8093AD0, 0x08093AD0 + 1
	.section .text.sub_8093DE4, "ax", %progbits
@ sub_8093DE4 @ JP 0x08093DE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093DE4
	.thumb_func
sub_8093DE4:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	ldr r0, _08093E24 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08093E2C
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093E2C
	ldr r0, _08093E28 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093E16
	movs r0, #0x6b
	bl m4aSongNumStart
_08093E16:
	movs r0, #0
	bl sub_8089094
	adds r0, r4, #0
	bl sub_8002DE4
	b _08093EEE
	.align 2, 0
_08093E24: .4byte 0x085775CC
_08093E28: .4byte 0x0202BCEC
_08093E2C:
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _08093E5A
	cmp r0, #1
	bgt _08093E40
	cmp r0, #0
	beq _08093E4A
	b _08093EBC
_08093E40:
	cmp r0, #2
	beq _08093E8C
	cmp r0, #3
	beq _08093E52
	b _08093EBC
_08093E4A:
	adds r0, r4, #0
	bl sub_8093744
	b _08093EBC
_08093E52:
	adds r0, r4, #0
	bl sub_8093AD0
	b _08093EBC
_08093E5A:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r2, r2, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093EBC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8092638
	b _08093EBC
_08093E8C:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldrh r2, [r4, #0x3e]
	subs r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093EBC
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8092638
_08093EBC:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08093EEE
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _08093EEE
	ldr r2, _08093EF4 @ =0x08A93994
	adds r0, #9
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_08093EEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093EF4: .4byte 0x08A93994

