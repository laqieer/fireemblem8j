	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.section .text.sub_804A3F0, "ax", %progbits
@ sub_804A3F0 @ JP 0x0804A3F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A3F0
	.thumb_func
sub_804A3F0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _0804A46C @ =0x080DEF04
	mov sl, r0
_0804A402:
	ldr r0, _0804A470 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov sb, r1
	cmp r0, #0
	beq _0804A48A
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, _0804A474 @ =0x03001810
_0804A434:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, _0804A478 @ =0x080DEF9F
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _0804A462
	ldr r0, [r1, #0xc]
	ldr r1, _0804A47C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _0804A480
_0804A462:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b _0804A484
	.align 2, 0
_0804A46C: .4byte 0x080DEF04
_0804A470: .4byte 0x085D31E8
_0804A474: .4byte 0x03001810
_0804A478: .4byte 0x080DEF9F
_0804A47C: .4byte 0x00010005
_0804A480:
	adds r0, r5, r7
	strb r4, [r0]
_0804A484:
	adds r6, #1
	cmp r6, #4
	ble _0804A434
_0804A48A:
	mov r2, sb
	cmp r2, #3
	ble _0804A402
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

