	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CBAE4, 0x080CBAE4 + 1
	.section .text.sub_80CBE7C, "ax", %progbits
@ sub_80CBE7C @ JP 0x080CBE7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBE7C
	.thumb_func
sub_80CBE7C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #0x2a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080CBE92
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_080CBE92:
	ldrh r1, [r5, #0x2a]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080CBEA2
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080CBEA2:
	ldrh r1, [r5, #0x2c]
	ldrh r2, [r5, #0x2e]
	movs r0, #1
	bl BG_SetPosition
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x60
	bhi _080CBEDC
	adds r3, r0, #0
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r4, r0, #0
	ldr r0, _080CBF40 @ =0x08B4FCD4
	movs r1, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CBF44 @ =0x020228A8
	ldr r1, _080CBF48 @ =0x00007FFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	bl BlendPaletteToColor
_080CBEDC:
	ldrh r0, [r5, #0x2a]
	adds r3, r0, #0
	subs r3, #0x80
	cmp r3, #0x60
	bhi _080CBEFA
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl sub_8012E84
	ldr r1, _080CBF4C @ =0x03003020
	adds r1, #0x44
	strb r0, [r1]
_080CBEFA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0xef
	bne _080CBF28
	ldr r2, _080CBF4C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0x20
	adds r1, r5, #0
	bl sub_80CBAE4
_080CBF28:
	ldrh r1, [r5, #0x2a]
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bne _080CBF50
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CBF54
	.align 2, 0
_080CBF40: .4byte 0x08B4FCD4
_080CBF44: .4byte 0x020228A8
_080CBF48: .4byte 0x00007FFF
_080CBF4C: .4byte 0x03003020
_080CBF50:
	adds r0, r1, #1
	strh r0, [r5, #0x2a]
_080CBF54:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

