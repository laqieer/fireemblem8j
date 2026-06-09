	.syntax unified
	.set sub_805055C, 0x0805055C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80500E8, "ax", %progbits
@ sub_80500E8 @ JP 0x080500E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80500E8
	.thumb_func
sub_80500E8:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x2d
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r7, [r5, #0x30]
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _0805010E
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80D65C4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0805010E:
	ldr r0, _08050130 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050134
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_805055C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0805016A
	ldr r2, [r7, #0x14]
	b _08050140
	.align 2, 0
_08050130: .4byte 0x085775CC
_08050134:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08050152
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #0x18]
_08050140:
	cmp r2, #0
	beq _0805016A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80D65C4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805016A
_08050152:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805016A
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0805016A
	adds r0, r4, #0
	bl sub_80D65C0
_0805016A:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

