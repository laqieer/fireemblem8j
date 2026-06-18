	.syntax unified
	.set SioSend16, 0x080424EC + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.section .text.sub_804195C, "ax", %progbits
@ SioHandleIrq_Serial @ JP 0x0804195C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioHandleIrq_Serial
	.thumb_func
SioHandleIrq_Serial:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov sb, r0
	ldr r0, _080419F0 @ =0x03004E18
	movs r2, #1
	str r2, [r0]
	ldr r1, _080419F4 @ =0x085D31E8
	ldr r0, [r1]
	mov r3, sb
	strb r3, [r0, #0x1e]
	ldr r0, _080419F8 @ =0x03004E14
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, _080419FC @ =0x0400010E
	mov r2, sb
	strh r2, [r0]
	ldr r2, [r1]
	ldr r3, _08041A00 @ =0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq _080419A0
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
_080419A0:
	ldr r0, _08041A04 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08041A08 @ =0x030017D8
	ldrb r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _08041A0C @ =0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, _08041A10 @ =0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
_080419C6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08041A14
	cmp r0, sl
	beq _08041A14
	ldr r2, _080419F4 @ =0x085D31E8
	ldr r0, [r2]
	adds r0, #0xb
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _080419E2
	movs r0, #1
	strb r0, [r1]
_080419E2:
	ldr r0, [r2]
	movs r1, #1
	lsls r1, r5
	ldrb r2, [r0, #8]
	orrs r1, r2
	strb r1, [r0, #8]
	b _08041A4E
	.align 2, 0
_080419F0: .4byte 0x03004E18
_080419F4: .4byte 0x085D31E8
_080419F8: .4byte 0x03004E14
_080419FC: .4byte 0x0400010E
_08041A00: .4byte 0x04000128
_08041A04: .4byte 0x04000120
_08041A08: .4byte 0x030017D8
_08041A0C: .4byte 0x00007FFF
_08041A10: .4byte 0x0000FFFF
_08041A14:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08041A4E
	ldr r0, _08041A40 @ =0x085D31E8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne _08041A44
	adds r1, #0x1a
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08041A4E
	.align 2, 0
_08041A40: .4byte 0x085D31E8
_08041A44:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_08041A4E:
	ldr r0, _08041AA4 @ =0x085D31E8
	mov r8, r0
	ldr r6, [r0]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	ldr r1, _08041AA8 @ =0x0203CA20
	ldr r2, _08041AAC @ =0x030017F8
	adds r2, r7, r2
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r0, [r4]
	ldr r1, _08041AB0 @ =0x0000FFFF
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r3, _08041AB4 @ =0x000001FF
	mov ip, r3
	mov r1, ip
	ands r0, r1
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _080419C6
	mov r4, r8
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	cmp r0, #4
	bls _08041B70
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _08041AB8
	cmp r0, #3
	beq _08041B18
	b _08041B70
	.align 2, 0
_08041AA4: .4byte 0x085D31E8
_08041AA8: .4byte 0x0203CA20
_08041AAC: .4byte 0x030017F8
_08041AB0: .4byte 0x0000FFFF
_08041AB4: .4byte 0x000001FF
_08041AB8:
	ldr r0, _08041B04 @ =0x030017EA
	ldr r2, _08041B08 @ =0x030017E8
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq _08041AE0
	ldr r1, _08041B0C @ =0x0203C620
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl SioSend16
_08041AE0:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08041B70
	ldr r0, _08041B10 @ =0x00001B7C
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	beq _08041B70
	ldr r1, _08041B14 @ =0x0400010C
	rsbs r0, r0, #0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b _08041B70
	.align 2, 0
_08041B04: .4byte 0x030017EA
_08041B08: .4byte 0x030017E8
_08041B0C: .4byte 0x0203C620
_08041B10: .4byte 0x00001B7C
_08041B14: .4byte 0x0400010C
_08041B18:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08041B32
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl SioSend16
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _08041B88 @ =0x00005FFF
	strh r0, [r1, #0x30]
_08041B32:
	movs r5, #0
	ldr r6, _08041B8C @ =0x00001286
	mov r4, sp
_08041B38:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041B56
	ldrh r0, [r4]
	cmp r0, r6
	beq _08041B56
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_08041B56:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08041B38
	mov r3, sb
	cmp r3, #0
	bne _08041B70
	ldr r0, _08041B90 @ =0x085D31E8
	ldr r0, [r0]
	ldr r1, _08041B94 @ =0x00001B7E
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_08041B70:
	ldr r1, _08041B98 @ =0x03004E14
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041B88: .4byte 0x00005FFF
_08041B8C: .4byte 0x00001286
_08041B90: .4byte 0x085D31E8
_08041B94: .4byte 0x00001B7E
_08041B98: .4byte 0x03004E14

