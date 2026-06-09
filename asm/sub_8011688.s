	.syntax unified
	.set GetItemCost, 0x080173E4 + 1
	.set sub_8011640, 0x08011640 + 1
	.set sub_8011730, 0x08011730 + 1
	.section .text.sub_8011688, "ax", %progbits
@ sub_8011688 @ JP 0x08011688 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011688
	.thumb_func
sub_8011688:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0x9a
	blt _080116B8
	cmp r0, #0xa0
	ble _080116A6
	cmp r0, #0xb9
	bgt _080116B8
	cmp r0, #0xb8
	blt _080116B8
_080116A6:
	adds r0, r2, #0
	bl GetItemCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8011730
	b _080116C0
_080116B8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8011640
_080116C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

