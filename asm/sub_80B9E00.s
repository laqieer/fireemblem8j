	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.section .text.sub_80B9E00, "ax", %progbits
@ sub_80B9E00 @ JP 0x080B9E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9E00
	.thumb_func
sub_80B9E00:
	push {r4, lr}
	adds r4, r0, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _080B9E20
	adds r0, r4, #0
	bl sub_80B9DEC
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080B9E20
	movs r0, #1
	b _080B9E22
_080B9E20:
	movs r0, #0
_080B9E22:
	pop {r4}
	pop {r1}
	bx r1

