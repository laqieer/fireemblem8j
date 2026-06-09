	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.section .text.sub_804A2EC, "ax", %progbits
@ sub_804A2EC @ JP 0x0804A2EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A2EC
	.thumb_func
sub_804A2EC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
_0804A2FA:
	ldr r0, _0804A37C @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _0804A380 @ =0x080DEF04
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _0804A364
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _0804A384 @ =0x080DEF24
	mov sl, r0
_0804A32C:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, _0804A388 @ =0x080DEF9F
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq _0804A35E
	ldr r0, _0804A38C @ =0x03001810
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
_0804A35E:
	adds r6, #1
	cmp r6, #4
	ble _0804A32C
_0804A364:
	mov r7, sb
	cmp r7, #3
	ble _0804A2FA
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A37C: .4byte 0x085D31E8
_0804A380: .4byte 0x080DEF04
_0804A384: .4byte 0x080DEF24
_0804A388: .4byte 0x080DEF9F
_0804A38C: .4byte 0x03001810

