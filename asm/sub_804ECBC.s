	.syntax unified
	.set MultiBootInit, 0x0804E754 + 1
	.set MultiBootSend, 0x0804EB80 + 1
	.section .text.sub_804ECBC, "ax", %progbits
@ MultiBootHandShake @ JP 0x0804ECBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MultiBootHandShake
	.thumb_func
MultiBootHandShake:
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _0804ECD8
	cmp r0, #0xe0
	blt _0804ECE8
	cmp r0, #0xe8
	bgt _0804ECE8
	cmp r0, #0xe7
	blt _0804ECE8
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _0804ED48
_0804ECD8:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _0804ED3A
_0804ECE8:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _0804ED44 @ =0x04000126
_0804ECF0:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804ED04
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804ECD8
_0804ED04:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804ECF0
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0804ED32
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_0804ED32:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_0804ED38:
	ldrh r1, [r3]
_0804ED3A:
	adds r0, r3, #0
	bl MultiBootSend
	b _0804EDA0
	.align 2, 0
_0804ED44: .4byte 0x04000126
_0804ED48:
	lsls r0, r4, #1
	ldr r1, _0804ED90 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804ED64
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804ED94
_0804ED64:
	subs r4, #1
	cmp r4, #0
	bne _0804ED48
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0804ED9E
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _0804ED38
	.align 2, 0
_0804ED90: .4byte 0x04000120
_0804ED94:
	adds r0, r3, #0
	bl MultiBootInit
	movs r0, #0x71
	b _0804EDA0
_0804ED9E:
	movs r0, #0
_0804EDA0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

