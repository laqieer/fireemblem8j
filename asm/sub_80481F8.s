	.syntax unified
	.set IsExtraMapAvailable, 0x080AB634 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SioClearOutgoingQueue, 0x08042A78 + 1
	.set SioSend, 0x08042238 + 1
	.set Sio_CheckLinkAlive, 0x08042164 + 1
	.set nullsub_13, 0x08008F28 + 1
	.set sub_8042678, 0x08042678 + 1
	.section .text.sub_80481F8, "ax", %progbits
@ sub_80481F8 @ JP 0x080481F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80481F8
	.thumb_func
sub_80481F8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08048220 @ =0x085D3234
	bl Proc_Find
	cmp r0, #0
	beq _08048228
	ldr r0, _08048224 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08048304
	adds r0, r5, #0
	movs r1, #4
	b _080482C0
	.align 2, 0
_08048220: .4byte 0x085D3234
_08048224: .4byte 0x085775CC
_08048228:
	ldr r0, _08048248 @ =0x085D31E8
	ldr r3, [r0]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _08048240
	adds r1, r3, #0
	adds r1, #0xb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0804824C
_08048240:
	adds r0, r5, #0
	movs r1, #0
	b _080482C0
	.align 2, 0
_08048248: .4byte 0x085D31E8
_0804824C:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x1a
_08048252:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804825C
	adds r4, #1
_0804825C:
	adds r2, #1
	cmp r2, #3
	ble _08048252
	bl Sio_CheckLinkAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804827A
	ldr r6, _08048280 @ =0x085D31E8
	ldr r2, [r6]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _0804827A
	cmp r4, #0
	beq _08048284
_0804827A:
	adds r0, r5, #0
	movs r1, #0
	b _080482C0
	.align 2, 0
_08048280: .4byte 0x085D31E8
_08048284:
	ldr r0, _080482C8 @ =0x03004E20
	movs r1, #0xcc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl SioSend
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080482CC
	bl IsExtraMapAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080482CC
	mov r1, sp
	movs r0, #1
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_8042678
	adds r0, r5, #0
	movs r1, #3
_080482C0:
	bl nullsub_13
_080482C4:
	movs r0, #0
	b _08048306
	.align 2, 0
_080482C8: .4byte 0x03004E20
_080482CC:
	ldr r4, _08048300 @ =0x085D31E8
	ldr r2, [r4]
	ldrb r0, [r2, #9]
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08048304
	strb r1, [r2, #9]
	bl SioClearOutgoingQueue
	ldr r1, [r4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	strb r2, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080482C4
	adds r0, r5, #0
	movs r1, #1
	bl nullsub_13
	b _080482C4
	.align 2, 0
_08048300: .4byte 0x085D31E8
_08048304:
	movs r0, #1
_08048306:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

