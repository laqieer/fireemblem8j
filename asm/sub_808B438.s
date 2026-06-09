	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_808B55C, 0x0808B55C + 1
	.section .text.sub_808B438, "ax", %progbits
@ sub_808B438 @ JP 0x0808B438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B438
	.thumb_func
sub_808B438:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0xf
	movs r0, #0xf0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_808B55C
	cmp r0, #2
	beq _0808B480
	cmp r0, #2
	bgt _0808B45E
	cmp r0, #1
	beq _0808B464
	b _0808B48C
_0808B45E:
	cmp r0, #3
	beq _0808B488
	b _0808B48C
_0808B464:
	cmp r4, #0x8f
	bgt _0808B46A
	movs r4, #0x90
_0808B46A:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	cmp r0, #8
	ble _0808B48A
	adds r5, #0x20
	b _0808B48C
_0808B480:
	cmp r4, #0x5f
	bgt _0808B48A
	movs r4, #0x60
	b _0808B48A
_0808B488:
	movs r4, #0x80
_0808B48A:
	adds r5, #0x10
_0808B48C:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

