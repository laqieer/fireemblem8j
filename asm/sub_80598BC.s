	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_80598BC, "ax", %progbits
@ sub_80598BC @ JP 0x080598BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80598BC
	.thumb_func
sub_80598BC:
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7d
	beq _080598F0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7e
	beq _080598F0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x7f
	beq _080598F0
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x80
	beq _080598F0
	movs r0, #0
	b _080598F2
_080598F0:
	movs r0, #1
_080598F2:
	pop {r4, r5}
	pop {r1}
	bx r1

