	.syntax unified
	.set GetItemCost, 0x080173E4 + 1
	.set UnitHasItem, 0x080177A0 + 1
	.section .text.sub_80B9DA4, "ax", %progbits
@ sub_80B9DA4 @ JP 0x080B9DA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9DA4
	.thumb_func
sub_80B9DA4:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemCost
	adds r4, r0, #0
	ldr r0, _080B9DD8 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B9DC4
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	adds r4, r4, r0
_080B9DC4:
	adds r0, r5, #0
	movs r1, #0x73
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9DDC
	lsls r0, r4, #0x10
	b _080B9DE2
	.align 2, 0
_080B9DD8: .4byte 0x0202BCAC
_080B9DDC:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	lsls r0, r0, #0xf
_080B9DE2:
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

