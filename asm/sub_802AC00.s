	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_802AC00, "ax", %progbits
@ sub_802AC00 @ JP 0x0802AC00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802AC00
	.thumb_func
sub_802AC00:
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r1, r1, r0
	adds r5, r2, #0
	adds r5, #0x6a
	movs r4, #0
	strh r1, [r5]
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802AC2C
	strh r4, [r5]
_0802AC2C:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0802AC36
	strh r4, [r5]
_0802AC36:
	movs r4, #0
	b _0802AC3C
_0802AC3A:
	adds r4, #1
_0802AC3C:
	cmp r4, #4
	bgt _0802AC60
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0802AC60
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0802AC3A
	movs r0, #0
	strh r0, [r5]
_0802AC60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

