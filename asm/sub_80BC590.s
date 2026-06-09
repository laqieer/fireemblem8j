	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80A8CE0, 0x080A8CE0 + 1
	.set sub_80BC2A4, 0x080BC2A4 + 1
	.section .text.sub_80BC590, "ax", %progbits
@ sub_80BC590 @ JP 0x080BC590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC590
	.thumb_func
sub_80BC590:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #6
	adds r2, r5, #0
	subs r2, #0x88
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	movs r0, #0xf
	ands r0, r5
	cmp r0, #0
	bne _080BC612
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r1, [r0]
	adds r2, r5, #0
	adds r5, r0, #0
	cmp r2, #0
	bge _080BC5C0
	adds r2, #0xf
_080BC5C0:
	asrs r0, r2, #4
	cmp r1, r0
	bne _080BC612
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	cmp r0, r2
	blt _080BC5F6
	subs r0, r0, r2
	cmp r0, #1
	bne _080BC5E2
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80BC2A4
	b _080BC606
_080BC5E2:
	cmp r0, #2
	ble _080BC5EE
	adds r0, r4, #0
	bl sub_8002DE4
	b _080BC606
_080BC5EE:
	movs r0, #0
	bl sub_80BC2A4
	b _080BC606
_080BC5F6:
	bl sub_80A8CE0
	ldrb r1, [r5]
	bl sub_80BC2A4
	ldr r1, [r4, #0x2c]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
_080BC606:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080BC612:
	ldr r0, _080BC634 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	ldr r1, [r4, #0x34]
	cmp r0, #0
	beq _080BC628
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_080BC628:
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC634: .4byte 0x085775CC

