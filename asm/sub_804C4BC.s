	.syntax unified
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_804C4BC, "ax", %progbits
@ sub_804C4BC @ JP 0x0804C4BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C4BC
	.thumb_func
sub_804C4BC:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804C500 @ =0x06015000
	movs r1, #6
	bl sub_808BB14
	ldr r2, _0804C504 @ =0x000006E1
	movs r0, #0x40
	movs r1, #0x38
	bl sub_808B1F4
	movs r4, #0
	ldr r6, _0804C508 @ =0x0203DD96
_0804C4D6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C4EE
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C4EE
	str r4, [r5, #0x58]
_0804C4EE:
	adds r4, #1
	cmp r4, #3
	ble _0804C4D6
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C500: .4byte 0x06015000
_0804C504: .4byte 0x000006E1
_0804C508: .4byte 0x0203DD96

