	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioClearOutgoingQueue, 0x08042A78 + 1
	.set SioSend, 0x08042238 + 1
	.set Sio_AreAllPlayersReady, 0x080421EC + 1
	.set Sio_CheckLinkAlive, 0x08042164 + 1
	.set Sio_CountConnectedPlayers, 0x080420BC + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042678, 0x08042678 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_8045C5C, 0x08045C5C + 1
	.set sub_8045C80, 0x08045C80 + 1
	.set sub_8045C8C, 0x08045C8C + 1
	.set sub_8045EA4, 0x08045EA4 + 1
	.set sub_804D08C, 0x0804D08C + 1
	.set sub_804D0BC, 0x0804D0BC + 1
	.section .text.sub_8045EEC, "ax", %progbits
@ sub_8045EEC @ JP 0x08045EEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045EEC
	.thumb_func
sub_8045EEC:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _08045F2C @ =0x0203DD24
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_8045C8C
	ldr r0, _08045F30 @ =0x085D3234
	bl Proc_Find
	cmp r0, #0
	beq _08045F38
	ldr r0, _08045F34 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08045F1E
	b _08046102
_08045F1E:
	movs r0, #1
	bl sub_8043190
	bl sub_804D0BC
	b _08045F6C
	.align 2, 0
_08045F2C: .4byte 0x0203DD24
_08045F30: .4byte 0x085D3234
_08045F34: .4byte 0x085775CC
_08045F38:
	bl sub_804D0BC
	ldr r2, _08045F80 @ =0x085D31E8
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x34]
	movs r3, #0
	adds r1, #0x1a
	adds r5, r2, #0
_08045F4C:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08045F56
	adds r6, #1
_08045F56:
	adds r3, #1
	cmp r3, #3
	ble _08045F4C
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08045F84
_08045F6C:
	bl sub_8045C5C
	bl sub_8045C80
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08046102
	.align 2, 0
_08045F80: .4byte 0x085D31E8
_08045F84:
	bl Sio_CheckLinkAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045F9A
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bhi _08045F9A
	cmp r6, #0
	beq _08045FC4
_08045F9A:
	bl sub_8045C5C
	bl sub_8045C80
	adds r0, r4, #0
	bl sub_8045EA4
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _08045FC0 @ =0x000006D3
	movs r1, #1
	bl sub_8043084
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804D08C
	b _08046102
	.align 2, 0
_08045FC0: .4byte 0x000006D3
_08045FC4:
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08046058
	bl Sio_AreAllPlayersReady
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08046058
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _08045FEA
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, _08046048 @ =0x000006D5
	movs r1, #1
	bl sub_8043084
_08045FEA:
	ldr r0, _0804604C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804606A
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_08046008:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _08046008
	movs r0, #2
	bl sub_8043190
	bl Sio_CountConnectedPlayers
	ldr r2, _08046050 @ =0x085D31E8
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08046054 @ =0x0203DA20
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl SioClearOutgoingQueue
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_8042678
	str r0, [r4, #0x34]
	b _080460C8
	.align 2, 0
_08046048: .4byte 0x000006D5
_0804604C: .4byte 0x085775CC
_08046050: .4byte 0x085D31E8
_08046054: .4byte 0x0203DA20
_08046058:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _0804606A
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _080460D0 @ =0x000006D4
	movs r1, #1
	bl sub_8043084
_0804606A:
	ldr r5, _080460D4 @ =0x085D31E8
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080460DC
	ldrb r0, [r1, #6]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080460DC
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080460DC
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_080460A2:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _080460A2
	bl Sio_CountConnectedPlayers
	ldr r2, _080460D4 @ =0x085D31E8
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _080460D8 @ =0x0203DA20
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl SioClearOutgoingQueue
_080460C8:
	adds r0, r4, #0
	bl sub_8002DE4
	b _08046102
	.align 2, 0
_080460D0: .4byte 0x000006D4
_080460D4: .4byte 0x085D31E8
_080460D8: .4byte 0x0203DA20
_080460DC:
	bl sub_8000CD8
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08046102
	ldr r0, _0804610C @ =0x03004E20
	movs r1, #0xcc
	strb r1, [r0]
	ldr r1, _08046110 @ =0x085D31E8
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl SioSend
_08046102:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804610C: .4byte 0x03004E20
_08046110: .4byte 0x085D31E8

