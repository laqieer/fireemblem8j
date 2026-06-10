	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8004320, 0x08004320 + 1
	.set sub_8042D20, 0x08042D20 + 1
	.section .text.sub_8048594, "ax", %progbits
@ sub_8048594 @ JP 0x08048594 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048594
	.thumb_func
sub_8048594:
	push {lr}
	bl sub_8042D20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080485A4
	movs r0, #1
	b _080485D6
_080485A4:
	ldr r0, _080485DC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080485B6
	movs r0, #0x7e
	bl m4aSongNumStart
_080485B6:
	bl sub_8004320
	ldr r0, _080485E0 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080485D4
	ldr r0, _080485E4 @ =0x02000000
	ldr r1, _080485E8 @ =0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
_080485D4:
	movs r0, #0
_080485D6:
	pop {r1}
	bx r1
	.align 2, 0
_080485DC: .4byte 0x0202BCEC
_080485E0: .4byte 0x085D31E8
_080485E4: .4byte 0x02000000
_080485E8: .4byte 0x0E007400

