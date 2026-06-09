	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set ClearSupplyItems, 0x08031454 + 1
	.section .text.sub_809A5D4, "ax", %progbits
@ sub_809A5D4 @ JP 0x0809A5D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A5D4
	.thumb_func
sub_809A5D4:
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	movs r5, #0x88
_0809A5DE:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _0809A5DE
	pop {r4, r5}
	pop {r0}
	bx r0

