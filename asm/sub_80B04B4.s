	.syntax unified
	.set sub_80B0444, 0x080B0444 + 1
	.section .text.sub_80B04B4, "ax", %progbits
@ sub_80B04B4 @ JP 0x080B04B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B04B4
	.thumb_func
sub_80B04B4:
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080B04EC
	cmp r0, #4
	bgt _080B04D8
	cmp r0, #1
	beq _080B0542
	cmp r0, #2
	beq _080B04F6
	b _080B04F8
_080B04D8:
	cmp r0, #0x10
	beq _080B04F8
	cmp r0, #0x10
	bgt _080B04E6
	cmp r0, #8
	beq _080B04F6
	b _080B04F8
_080B04E6:
	cmp r0, #0x80
	bne _080B04F8
	b _080B04F6
_080B04EC:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B04F8
_080B04F6:
	movs r1, #1
_080B04F8:
	cmp r2, #0
	ble _080B0510
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080B050C
	movs r0, #0
	b _080B0522
_080B050C:
	adds r0, r3, #1
	b _080B0522
_080B0510:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080B0520
	movs r0, #2
	b _080B0522
_080B0520:
	subs r0, r3, #1
_080B0522:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080B053E
	ldrb r0, [r4]
	bl sub_80B0444
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080B0542
_080B053E:
	movs r0, #1
	b _080B0544
_080B0542:
	movs r0, #0
_080B0544:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

