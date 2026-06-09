	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80BC1B8, "ax", %progbits
@ sub_80BC1B8 @ JP 0x080BC1B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC1B8
	.thumb_func
sub_80BC1B8:
	push {r4, r5, r6, lr}
	ldr r2, _080BC298 @ =0x0000FF78
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _080BC29C @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	movs r4, #0
	ldr r6, _080BC2A0 @ =0x08AC0EDC
	movs r5, #0x48
_080BC22E:
	lsls r1, r4, #3
	ldr r0, [r6]
	adds r0, r0, r1
	movs r1, #4
	bl InitText
	ldr r0, [r6]
	adds r0, r0, r5
	movs r1, #9
	bl InitText
	adds r5, #8
	adds r4, #1
	cmp r4, #8
	ble _080BC22E
	ldr r5, _080BC2A0 @ =0x08AC0EDC
	ldr r0, [r5]
	adds r0, #0x90
	movs r1, #3
	bl InitText
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #2
	bl InitText
	ldr r4, [r5]
	adds r4, #0x90
	movs r0, #0xe6
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r0, [r5]
	adds r0, #0x98
	movs r1, #3
	bl sub_8003D90
	ldr r4, [r5]
	adds r4, #0x98
	movs r0, #0xdf
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC298: .4byte 0x0000FF78
_080BC29C: .4byte 0x03003020
_080BC2A0: .4byte 0x08AC0EDC

