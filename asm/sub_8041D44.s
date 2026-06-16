	.syntax unified
	.set SioQueuePendingRecvData, 0x080425A4 + 1
	.set SioSend, 0x08042238 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_8041D0C, 0x08041D0C + 1
	.set sub_8042330, 0x08042330 + 1
	.section .text.sub_8041D44, "ax", %progbits
@ SioMain_Loop @ JP 0x08041D44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioMain_Loop
	.thumb_func
SioMain_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08041D98 @ =0x085D31E8
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _08041D56
	b _080420AE
_08041D56:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
_08041D64:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, _08041D98 @ =0x085D31E8
	ldr r1, [r5]
	adds r1, #0x32
	bl sub_8042330
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne _08041D82
	b _080420A6
_08041D82:
	cmp r0, #0x16
	beq _08041DB0
	cmp r0, #0x16
	bgt _08041D9C
	cmp r0, #4
	bne _08041D90
	b _08041EE0
_08041D90:
	cmp r0, #0xa
	beq _08041DB0
	b _080420A6
	.align 2, 0
_08041D98: .4byte 0x085D31E8
_08041D9C:
	cmp r0, #0x2e
	beq _08041DB0
	cmp r0, #0x2e
	bgt _08041DAA
	cmp r0, #0x2a
	beq _08041DB0
	b _080420A6
_08041DAA:
	cmp r1, #0x80
	beq _08041DB0
	b _080420A6
_08041DB0:
	ldr r6, _08041E08 @ =0x085D31E8
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0xcc
	beq _08041E3C
	adds r1, r7, #1
	mov r8, r1
	cmp r0, #0xcf
	beq _08041DC8
	b _080420A6
_08041DC8:
	ldrb r1, [r5, #1]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _08041DD4
	b _080420A6
_08041DD4:
	lsls r1, r1, #1
	adds r4, r3, #0
	adds r4, #0x26
	adds r1, r4, r1
	ldrh r0, [r5, #2]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08041E10
	ldr r0, _08041E0C @ =0x03004EFC
	movs r1, #0xce
	strb r1, [r0]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	b _08041D64
	.align 2, 0
_08041E08: .4byte 0x085D31E8
_08041E0C: .4byte 0x03004EFC
_08041E10:
	adds r0, r5, #0
	bl SioQueuePendingRecvData
	ldr r0, _08041E38 @ =0x03004EFC
	movs r1, #0xce
	strb r1, [r0]
	ldr r3, [r6]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	adds r1, #1
	strh r1, [r0, #2]
	b _08041ED0
	.align 2, 0
_08041E38: .4byte 0x03004EFC
_08041E3C:
	movs r2, #0
	lsls r1, r7, #4
	adds r0, r7, #1
	mov r8, r0
	ldr r0, _08041EA0 @ =0x0203DA20
	subs r1, r1, r7
	adds r3, #0x38
	adds r0, #0xa1
	adds r1, r1, r0
_08041E4E:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #0xe
	ble _08041E4E
	lsrs r0, r4, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08041E7A
	ldr r0, _08041EA4 @ =0x085D31E8
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrh r2, [r5, #2]
	cmp r0, r2
	bne _08041E7A
	ldrh r0, [r1, #4]
	cmp r0, #5
	bls _08041E88
_08041E7A:
	lsrs r0, r4, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08041EAC
_08041E88:
	ldr r0, _08041EA4 @ =0x085D31E8
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08041E96
	b _080420A6
_08041E96:
	ldr r0, _08041EA8 @ =0x03004EFC
	movs r1, #0xc6
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b _08041ECC
	.align 2, 0
_08041EA0: .4byte 0x0203DA20
_08041EA4: .4byte 0x085D31E8
_08041EA8: .4byte 0x03004EFC
_08041EAC:
	ldr r0, _08041ED8 @ =0x085D31E8
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08041EBA
	b _080420A6
_08041EBA:
	ldrb r0, [r1]
	movs r2, #0xc5
	ldrh r5, [r5, #2]
	cmp r0, r5
	beq _08041EC6
	movs r2, #0xc7
_08041EC6:
	ldr r0, _08041EDC @ =0x03004EFC
	strb r2, [r0]
	ldrb r1, [r1, #6]
_08041ECC:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
_08041ED0:
	movs r1, #4
	bl SioSend
	b _080420A6
	.align 2, 0
_08041ED8: .4byte 0x085D31E8
_08041EDC: .4byte 0x03004EFC
_08041EE0:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0xc4
	cmp r0, #0xa
	bls _08041EF0
	b _080420A6
_08041EF0:
	lsls r0, r0, #2
	ldr r1, _08041EFC @ =_08041F00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041EFC: .4byte _08041F00
_08041F00: @ jump table
	.4byte _0804209C @ case 0
	.4byte _08042034 @ case 1
	.4byte _08042060 @ case 2
	.4byte _08041FF0 @ case 3
	.4byte _080420A6 @ case 4
	.4byte _08041F2C @ case 5
	.4byte _080420A6 @ case 6
	.4byte _080420A6 @ case 7
	.4byte _080420A6 @ case 8
	.4byte _080420A6 @ case 9
	.4byte _08041F44 @ case 10
_08041F2C:
	ldr r0, _08041F40 @ =0x085D31E8
	ldr r2, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r1, [r2, #0xa]
	orrs r0, r1
	strb r0, [r2, #0xa]
	b _080420A2
	.align 2, 0
_08041F40: .4byte 0x085D31E8
_08041F44:
	ldr r6, _08041FE4 @ =0x085D31E8
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _08041F58
	b _080420A6
_08041F58:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne _08041F66
	b _080420A6
_08041F66:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq _08041F70
	b _080420A6
_08041F70:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	ldrh r1, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq _08041F80
	b _080420A6
_08041F80:
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r3, #0xf]
	orrs r0, r1
	strb r0, [r3, #0xf]
	ldr r0, _08041FE8 @ =0x030017E0
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #0xf]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq _08041FA2
	b _080420A6
_08041FA2:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, _08041FEC @ =0x00001B74
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b _080420A6
	.align 2, 0
_08041FE4: .4byte 0x085D31E8
_08041FE8: .4byte 0x030017E0
_08041FEC: .4byte 0x00001B74
_08041FF0:
	ldrb r0, [r5, #2]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _080420A6
	ldr r4, _08042030 @ =0x085D31E8
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r3, #2
	strb r3, [r0]
	ldr r1, [r4]
	ldrh r2, [r1, #2]
	movs r0, #0x30
	ands r0, r2
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r3, [r0]
	ldr r1, [r4]
	b _08042054
	.align 2, 0
_08042030: .4byte 0x085D31E8
_08042034:
	ldrb r0, [r5, #2]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _080420A6
	ldr r2, _0804205C @ =0x085D31E8
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
_08042054:
	movs r0, #6
	strh r0, [r1, #4]
	b _080420A6
	.align 2, 0
_0804205C: .4byte 0x085D31E8
_08042060:
	ldr r0, _08042094 @ =0x0203DA20
	adds r0, #0x9c
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, _08042098 @ =0x085D31E8
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	ldr r1, [r3]
	ldrh r0, [r5, #2]
	lsls r2, r0
	ldrb r0, [r1, #9]
	orrs r2, r0
	strb r2, [r1, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r4, [r0]
	b _080420A2
	.align 2, 0
_08042094: .4byte 0x0203DA20
_08042098: .4byte 0x085D31E8
_0804209C:
	ldrb r0, [r5, #1]
	bl sub_8041D0C
_080420A2:
	adds r7, #1
	mov r8, r7
_080420A6:
	mov r7, r8
	cmp r7, #3
	bgt _080420AE
	b _08041D64
_080420AE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

