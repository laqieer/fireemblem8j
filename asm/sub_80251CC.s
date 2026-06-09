	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetUnit, 0x08019108 + 1
	.set IsSameAllegiance, 0x08024D54 + 1
	.section .text.sub_80251CC, "ax", %progbits
@ sub_80251CC @ JP 0x080251CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80251CC
	.thumb_func
sub_80251CC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0802527C @ =0x02033F38
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegiance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025274
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08025274
	ldr r3, [r4, #4]
	ldrb r0, [r3, #4]
	cmp r0, #0x51
	beq _08025274
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08025238
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	bne _08025214
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08025238
_08025214:
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025238
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025238:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08025274
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _08025274
	ldr r0, _0802527C @ =0x02033F38
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _08025266
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _08025274
_08025266:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl AddTarget
_08025274:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802527C: .4byte 0x02033F38

