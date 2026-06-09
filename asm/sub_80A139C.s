	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.set sub_80C8E00, 0x080C8E00 + 1
	.section .text.sub_80A139C, "ax", %progbits
@ sub_80A139C @ JP 0x080A139C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A139C
	.thumb_func
sub_80A139C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A13C0 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A13C4
	bl sub_80C8E00
	cmp r0, #0
	beq _080A13D4
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x2a
	b _080A13D2
	.align 2, 0
_080A13C0: .4byte 0x03005270
_080A13C4:
	ldr r0, _080A13EC @ =0x08A93FE8
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
_080A13D2:
	strb r1, [r0]
_080A13D4:
	adds r0, r4, #0
	bl sub_80B2874
	movs r0, #0
	bl EndFaceById
	bl sub_8097D18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A13EC: .4byte 0x08A93FE8

