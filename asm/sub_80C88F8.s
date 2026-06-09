	.syntax unified
	.set GetWMCursorScreenQuadrant, 0x080C5668 + 1
	.set PutWmMinimapSprites, 0x080C881C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C88F8, "ax", %progbits
@ sub_80C88F8 @ JP 0x080C88F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C88F8
	.thumb_func
sub_80C88F8:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl PutWmMinimapSprites
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	adds r5, r4, #0
	adds r5, #0x2b
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r7, r4, #0
	adds r7, #0x2c
	strb r0, [r7]
	ldr r6, _080C8994 @ =0x03005270
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r3, r0, #8
	strb r3, [r1]
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C897E
	movs r0, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _080C898C
	ldrb r0, [r2]
	ldrb r5, [r5]
	cmp r0, r5
	bne _080C894A
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldrb r7, [r7]
	cmp r0, r7
	beq _080C898C
_080C894A:
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl GetWMCursorScreenQuadrant
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	beq _080C898C
	ldrb r1, [r6]
	lsls r1, r1, #0x1a
	ldr r3, _080C8998 @ =0x081F683C
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r5, r0
	adds r0, r0, r3
	adds r1, r2, #0
	ldrb r0, [r0]
	cmp r1, r0
	beq _080C898C
_080C897E:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080C898C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8994: .4byte 0x03005270
_080C8998: .4byte 0x081F683C

