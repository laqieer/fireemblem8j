	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8059790, "ax", %progbits
@ sub_8059790 @ JP 0x08059790 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8059790
	.thumb_func
sub_8059790:
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, #0x9e
	beq _080597AA
	cmp r0, #0x9e
	blt _080597DC
	cmp r0, #0xcb
	bgt _080597DC
	cmp r0, #0xc9
	blt _080597DC
_080597AA:
	adds r0, r1, #0
	bl GetItemIndex
	cmp r0, #0x36
	beq _080597CC
	cmp r0, #0x36
	bgt _080597BE
	cmp r0, #0x35
	beq _080597C4
	b _080597DC
_080597BE:
	cmp r0, #0x37
	beq _080597D4
	b _080597DC
_080597C4:
	ldr r0, _080597C8 @ =0x085E4530
	b _080597DE
	.align 2, 0
_080597C8: .4byte 0x085E4530
_080597CC:
	ldr r0, _080597D0 @ =0x085E4510
	b _080597DE
	.align 2, 0
_080597D0: .4byte 0x085E4510
_080597D4:
	ldr r0, _080597D8 @ =0x085E4550
	b _080597DE
	.align 2, 0
_080597D8: .4byte 0x085E4550
_080597DC:
	movs r0, #0
_080597DE:
	pop {r1}
	bx r1
	.align 2, 0

