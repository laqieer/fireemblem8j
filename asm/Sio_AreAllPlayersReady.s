	.syntax unified
	.section .text.Sio_AreAllPlayersReady, "ax", %progbits
@ Sio_AreAllPlayersReady @ JP 0x080421EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_AreAllPlayersReady
	.thumb_func
Sio_AreAllPlayersReady:
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _0804222C @ =0x085D31E8
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
_080421FA:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _08042204
	adds r2, #1
_08042204:
	adds r1, #1
	cmp r1, #3
	ble _080421FA
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _08042216
	cmp r2, #2
	beq _08042226
_08042216:
	cmp r0, #7
	bne _0804221E
	cmp r2, #3
	beq _08042226
_0804221E:
	cmp r0, #0xf
	bne _08042230
	cmp r2, #4
	bne _08042230
_08042226:
	movs r0, #1
	b _08042232
	.align 2, 0
_0804222C: .4byte 0x085D31E8
_08042230:
	movs r0, #0
_08042232:
	pop {r4}
	pop {r1}
	bx r1

