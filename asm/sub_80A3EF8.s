	.syntax unified
	.set sub_80B1844, 0x080B1844 + 1
	.section .text.sub_80A3EF8, "ax", %progbits
@ sub_80A3EF8 @ JP 0x080A3EF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3EF8
	.thumb_func
sub_80A3EF8:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080A3F30
	movs r0, #1
	bl sub_80B1844
	adds r3, r4, #0
	adds r3, #0x3c
	ldrb r0, [r3]
	cmp r0, #2
	bne _080A3F2C
	adds r2, r4, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
	strb r5, [r3]
	b _080A3F30
_080A3F2C:
	adds r0, #1
	strb r0, [r3]
_080A3F30:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080A3F62
	movs r0, #0
	bl sub_80B1844
	adds r3, r4, #0
	adds r3, #0x3c
	ldrb r0, [r3]
	cmp r0, #0
	bne _080A3F5E
	adds r2, r4, #0
	adds r2, #0x3d
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
	movs r0, #2
	b _080A3F60
_080A3F5E:
	subs r0, #1
_080A3F60:
	strb r0, [r3]
_080A3F62:
	pop {r4, r5}
	pop {r0}
	bx r0

