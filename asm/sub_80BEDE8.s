	.syntax unified
	.set GetCurrentBgmSong, 0x080021A8 + 1
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set sub_8002570, 0x08002570 + 1
	.section .text.sub_80BEDE8, "ax", %progbits
@ sub_80BEDE8 @ JP 0x080BEDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEDE8
	.thumb_func
sub_80BEDE8:
	push {r4, lr}
	ldr r4, _080BEDFC @ =0x0202BCEC
	ldrb r1, [r4, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BEE00
	movs r4, #8
	b _080BEE3E
	.align 2, 0
_080BEDFC: .4byte 0x0202BCEC
_080BEE00:
	ldr r0, _080BEE24 @ =0x03005270
	bl GetNextUnclearedNode
	cmp r0, #0
	blt _080BEE3C
	ldrb r1, [r4, #0x1b]
	cmp r1, #1
	blt _080BEE18
	cmp r1, #2
	ble _080BEE18
	cmp r1, #3
	beq _080BEE2C
_080BEE18:
	ldr r1, _080BEE28 @ =0x08AC1748
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	b _080BEE3E
	.align 2, 0
_080BEE24: .4byte 0x03005270
_080BEE28: .4byte 0x08AC1748
_080BEE2C:
	ldr r1, _080BEE38 @ =0x08AC1748
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	b _080BEE3E
	.align 2, 0
_080BEE38: .4byte 0x08AC1748
_080BEE3C:
	movs r4, #4
_080BEE3E:
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _080BEE4C
	adds r0, r4, #0
	bl sub_8002570
_080BEE4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

