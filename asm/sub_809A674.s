	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_8029E8C, 0x08029E8C + 1
	.section .text.sub_809A674, "ax", %progbits
@ sub_809A674 @ JP 0x0809A674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A674
	.thumb_func
sub_809A674:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _0809A6A2
_0809A684:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8029E8C
	cmp r0, #0
	beq _0809A69C
	movs r0, #1
	b _0809A6A4
_0809A69C:
	adds r4, #1
	cmp r4, r6
	blt _0809A684
_0809A6A2:
	movs r0, #0
_0809A6A4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

