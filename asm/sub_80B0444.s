	.syntax unified
	.set sub_80A9C30, 0x080A9C30 + 1
	.section .text.sub_80B0444, "ax", %progbits
@ sub_80B0444 @ JP 0x080B0444 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0444
	.thumb_func
sub_80B0444:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080B0482
	movs r5, #0
_080B0456:
	adds r0, r4, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	beq _080B047E
	cmp r4, #2
	bne _080B046C
	movs r4, #0
	b _080B0472
_080B046C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080B0472:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080B0456
	b _080B04AA
_080B047E:
	adds r0, r4, #0
	b _080B04AC
_080B0482:
	movs r5, #0
_080B0484:
	adds r0, r4, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r6
	beq _080B047E
	cmp r4, #0
	bne _080B049A
	movs r4, #2
	b _080B04A0
_080B049A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080B04A0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080B0484
_080B04AA:
	movs r0, #0xff
_080B04AC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

