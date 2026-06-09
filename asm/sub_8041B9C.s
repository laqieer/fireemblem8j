	.syntax unified
	.set SioSend, 0x08042238 + 1
	.set SioSend16, 0x080424EC + 1
	.set Sio_CheckLinkAlive, 0x08042164 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8042618, 0x08042618 + 1
	.set sub_808FF5C, 0x0808FF5C + 1
	.section .text.sub_8041B9C, "ax", %progbits
@ sub_8041B9C @ JP 0x08041B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041B9C
	.thumb_func
sub_8041B9C:
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08041BD8 @ =0x085D31E8
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _08041BAE
	b _08041CDC
_08041BAE:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _08041BB6
	b _08041CDC
_08041BB6:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne _08041C44
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _08041BF6
	cmp r0, #2
	bgt _08041BDC
	cmp r0, #1
	beq _08041C1C
	b _08041C44
	.align 2, 0
_08041BD8: .4byte 0x085D31E8
_08041BDC:
	cmp r0, #3
	bne _08041C44
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls _08041BF6
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl sub_808FF5C
_08041BF6:
	ldr r4, _08041C68 @ =0x085D31E8
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08041C1C
	bl Sio_CheckLinkAlive
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne _08041C1C
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl sub_808FF5C
_08041C1C:
	movs r4, #0
	ldr r5, _08041C68 @ =0x085D31E8
_08041C20:
	ldr r0, _08041C68 @ =0x085D31E8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08041C3E
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl sub_808FF5C
_08041C3E:
	adds r4, #1
	cmp r4, #3
	ble _08041C20
_08041C44:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne _08041CB8
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _08041C9A
	ldrb r0, [r1, #0x11]
	cmp r0, #0x3c
	bls _08041C6C
	bl sub_808FF5C
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b _08041CDC
	.align 2, 0
_08041C68: .4byte 0x085D31E8
_08041C6C:
	mov r0, sp
	bl sub_8042618
	cmp r0, #0
	beq _08041C9A
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SioSend
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08041C9A
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
_08041C9A:
	ldr r2, _08041CB4 @ =0x085D31E8
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b _08041CDC
	.align 2, 0
_08041CB4: .4byte 0x085D31E8
_08041CB8:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08041CDC
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08041CDC
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	rsbs r1, r1, #0
	bl SioSend16
	ldr r1, [r5]
	ldr r0, _08041CE4 @ =0x00005FFF
	strh r0, [r1, #0x30]
_08041CDC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041CE4: .4byte 0x00005FFF

