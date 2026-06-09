	.syntax unified
	.set sub_80B4414, 0x080B4414 + 1
	.set sub_80B4C30, 0x080B4C30 + 1
	.section .text.sub_80B3D00, "ax", %progbits
@ sub_80B3D00 @ JP 0x080B3D00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3D00
	.thumb_func
sub_80B3D00:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
_080B3D0E:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B3D4A
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_80B4414
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3D46
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80B4C30
	movs r0, #1
	b _080B3D58
_080B3D46:
	movs r0, #0
	b _080B3D58
_080B3D4A:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080B3D0E
_080B3D58:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

