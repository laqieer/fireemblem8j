	.syntax unified
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.section .text.sub_804A85C, "ax", %progbits
@ sub_804A85C @ JP 0x0804A85C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A85C
	.thumb_func
sub_804A85C:
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, _0804A8B4 @ =0x0203DD8C
	ldr r0, _0804A8B8 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r0, _0804A8BC @ =0x0203DA20
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A8C4
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
_0804A88A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A8A8
	ldr r0, _0804A8B8 @ =0x085D31E8
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _0804A8C0
_0804A8A8:
	adds r4, #1
	cmp r4, #3
	ble _0804A88A
	movs r5, #3
	b _0804A8F4
	.align 2, 0
_0804A8B4: .4byte 0x0203DD8C
_0804A8B8: .4byte 0x085D31E8
_0804A8BC: .4byte 0x0203DA20
_0804A8C0:
	adds r0, r4, #0
	b _0804A8F6
_0804A8C4:
	movs r4, #0
	adds r6, r2, #0
_0804A8C8:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A8EA
	ldr r0, _0804A8FC @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _0804A8EA
	ldr r0, [r6]
	cmp r7, r0
	bls _0804A8EC
_0804A8EA:
	subs r5, #1
_0804A8EC:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble _0804A8C8
_0804A8F4:
	adds r0, r5, #0
_0804A8F6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A8FC: .4byte 0x085D31E8

