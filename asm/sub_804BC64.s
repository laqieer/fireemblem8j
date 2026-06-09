	.syntax unified
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804BBA8, 0x0804BBA8 + 1
	.set sub_804BC1C, 0x0804BC1C + 1
	.section .text.sub_804BC64, "ax", %progbits
@ sub_804BC64 @ JP 0x0804BC64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804BC64
	.thumb_func
sub_804BC64:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	movs r1, #0
	bl sub_804BC1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804BCBC
	movs r4, #0
_0804BC7C:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BCB0
	ldr r5, _0804BCC4 @ =0x0203DD8C
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BCB0
	ldr r0, _0804BCC8 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq _0804BCB0
	lsls r0, r4, #6
	adds r0, #1
	bl sub_804BBA8
	cmp r6, r0
	bls _0804BCB0
	adds r6, r0, #0
	strb r4, [r5, #2]
_0804BCB0:
	adds r4, #1
	cmp r4, #3
	ble _0804BC7C
	adds r0, r7, #0
	bl sub_8002DE4
_0804BCBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BCC4: .4byte 0x0203DD8C
_0804BCC8: .4byte 0x0202BCEC

