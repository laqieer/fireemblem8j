	.syntax unified
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set GetUnitSupporterCharacter, 0x08028170 + 1
	.section .text.sub_80BB58C, "ax", %progbits
@ sub_80BB58C @ JP 0x080BB58C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB58C
	.thumb_func
sub_80BB58C:
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080BB5A4
	b _080BB5B8
_080BB596:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080BB5BA
_080BB5A4:
	movs r4, #0
_080BB5A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	cmp r0, #3
	beq _080BB596
	adds r4, #1
	cmp r4, #6
	ble _080BB5A6
_080BB5B8:
	movs r0, #0
_080BB5BA:
	pop {r4, r5}
	pop {r1}
	bx r1

