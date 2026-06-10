	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_802A094, "ax", %progbits
@ sub_802A094 @ JP 0x0802A094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A094
	.thumb_func
sub_802A094:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802A0C0
_0802A0A4:
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xcc
	bne _0802A0BA
	movs r0, #1
	b _0802A0C2
_0802A0BA:
	adds r4, #1
	cmp r4, r5
	blt _0802A0A4
_0802A0C0:
	movs r0, #0
_0802A0C2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

