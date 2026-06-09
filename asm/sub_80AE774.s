	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80AE774, "ax", %progbits
@ sub_80AE774 @ JP 0x080AE774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE774
	.thumb_func
sub_80AE774:
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080AE786
	movs r0, #0
	strb r0, [r2]
_080AE786:
	cmp r1, #0
	bne _080AE78E
_080AE78A:
	movs r0, #1
	b _080AE7D2
_080AE78E:
	cmp r1, #0
	ble _080AE7A0
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080AE79C
	adds r0, #1
	b _080AE7AC
_080AE79C:
	movs r0, #0
	b _080AE7AC
_080AE7A0:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080AE7AA
	movs r0, #2
	b _080AE7AC
_080AE7AA:
	subs r0, #1
_080AE7AC:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080AE7D0
	ldr r0, _080AE7CC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE78A
	movs r0, #0x66
	bl m4aSongNumStart
	b _080AE78A
	.align 2, 0
_080AE7CC: .4byte 0x0202BCEC
_080AE7D0:
	movs r0, #0
_080AE7D2:
	pop {r4}
	pop {r1}
	bx r1

