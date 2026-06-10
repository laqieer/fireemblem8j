	.syntax unified
	.set Sio_CheckLinkAlive, 0x08042164 + 1
	.set nullsub_13, 0x08008F28 + 1
	.set sub_8042720, 0x08042720 + 1
	.section .text.sub_8048378, "ax", %progbits
@ sub_8048378 @ JP 0x08048378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048378
	.thumb_func
sub_8048378:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, _080483C0 @ =0x085D31E8
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_0804838A:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08048394
	adds r4, #1
_08048394:
	adds r1, #1
	cmp r1, #3
	ble _0804838A
	bl Sio_CheckLinkAlive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080483B2
	ldr r0, _080483C0 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi _080483B2
	cmp r4, #0
	beq _080483C4
_080483B2:
	adds r0, r5, #0
	movs r1, #0
	bl nullsub_13
_080483BA:
	movs r0, #0
	b _080483E8
	.align 2, 0
_080483C0: .4byte 0x085D31E8
_080483C4:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080483E6
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080483BA
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_13
	b _080483BA
_080483E6:
	movs r0, #1
_080483E8:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

