	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioClearOutgoingQueue, 0x08042A78 + 1
	.set SioSend, 0x08042238 + 1
	.set Sio_CheckLinkAlive, 0x08042164 + 1
	.set Sio_SetSubState, 0x08042904 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8048B10, "ax", %progbits
@ sub_8048B10 @ JP 0x08048B10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048B10
	.thumb_func
sub_8048B10:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08048B5C @ =0x085D3234
	bl Proc_Find
	cmp r0, #0
	bne _08048BA0
	movs r1, #0
	ldr r0, _08048B60 @ =0x085D31E8
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08048B2A:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08048B34
	adds r4, #1
_08048B34:
	adds r1, #1
	cmp r1, #3
	ble _08048B2A
	bl Sio_CheckLinkAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048B52
	ldr r5, _08048B60 @ =0x085D31E8
	ldr r2, [r5]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08048B52
	cmp r4, #0
	beq _08048B64
_08048B52:
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08048BA0
	.align 2, 0
_08048B5C: .4byte 0x085D3234
_08048B60: .4byte 0x085D31E8
_08048B64:
	ldr r0, _08048BA8 @ =0x03004E20
	movs r1, #0xcc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl SioSend
	ldr r2, [r5]
	ldrb r0, [r2, #9]
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _08048BA0
	strb r1, [r2, #9]
	bl SioClearOutgoingQueue
	ldr r0, [r5]
	movs r1, #6
	strh r1, [r0, #4]
	movs r1, #0
	strb r1, [r0, #0x1e]
	movs r0, #3
	bl Sio_SetSubState
	adds r0, r6, #0
	bl sub_8002DE4
_08048BA0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048BA8: .4byte 0x03004E20

