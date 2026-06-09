	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80A9740, 0x080A9740 + 1
	.section .text.sub_80BAE08, "ax", %progbits
@ sub_80BAE08 @ JP 0x080BAE08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BAE08
	.thumb_func
sub_80BAE08:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080BAE0E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080BAE42
	ldr r2, [r0]
	cmp r2, #0
	beq _080BAE42
	ldr r0, [r0, #0xc]
	ldr r1, _080BAE54 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080BAE42
	ldrb r0, [r2, #4]
	bl sub_80A9740
	ldrb r1, [r0, #5]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, _080BAE58 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080BAE42
	adds r5, #1
_080BAE42:
	adds r4, #1
	cmp r4, #0x3f
	ble _080BAE0E
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BAE54: .4byte 0x00010004
_080BAE58: .4byte 0x0202BCEC

