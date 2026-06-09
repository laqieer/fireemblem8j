	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804DFE4, 0x0804DFE4 + 1
	.section .text.sub_8047140, "ax", %progbits
@ sub_8047140 @ JP 0x08047140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047140
	.thumb_func
sub_8047140:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _0804715C
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b _0804716A
_0804715C:
	cmp r0, #0
	bge _08047186
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
_0804716A:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804DFE4
	b _08047232
_08047186:
	ldr r0, _08047238 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080471CC
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq _080471CC
	movs r0, #3
	bl sub_8043190
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804DFE4
_080471CC:
	ldr r0, _08047238 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08047218
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt _08047218
	movs r0, #3
	bl sub_8043190
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804DFE4
_08047218:
	ldr r0, _08047238 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08047232
	movs r0, #1
	bl sub_8043190
	adds r0, r4, #0
	bl sub_8002DE4
_08047232:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047238: .4byte 0x085775CC

