	.syntax unified
	.set GetGmUnitFaction, 0x080C2018 + 1
	.section .text.sub_80C3C34, "ax", %progbits
@ sub_80C3C34 @ JP 0x080C3C34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3C34
	.thumb_func
sub_80C3C34:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r5, #0
	ldr r1, _080C3C64 @ =0x03005270
_080C3C3E:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080C3C74
	ldrb r0, [r1, #0x11]
	cmp r0, r2
	bne _080C3C74
	adds r0, r5, #0
	bl GetGmUnitFaction
	cmp r0, #1
	beq _080C3C68
	cmp r0, #1
	ble _080C3C5E
	cmp r0, #2
	beq _080C3C6C
_080C3C5E:
	movs r0, #0
	b _080C3C6E
	.align 2, 0
_080C3C64: .4byte 0x03005270
_080C3C68:
	movs r0, #0x80
	b _080C3C6E
_080C3C6C:
	movs r0, #0x40
_080C3C6E:
	str r0, [r4]
	adds r0, r5, #0
	b _080C3C82
_080C3C74:
	adds r1, #4
	adds r5, #1
	cmp r5, #6
	ble _080C3C3E
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4]
_080C3C82:
	pop {r4, r5}
	pop {r1}
	bx r1

