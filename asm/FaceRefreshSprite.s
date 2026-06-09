	.syntax unified
	.section .text.FaceRefreshSprite, "ax", %progbits
@ FaceRefreshSprite @ JP 0x080056C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FaceRefreshSprite
	.thumb_func
FaceRefreshSprite:
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x30]
	ldr r0, _080056F0 @ =0x00000807
	ands r1, r0
	cmp r1, #3
	beq _08005714
	cmp r1, #3
	bls _080056F4
	cmp r1, #5
	beq _08005724
	cmp r1, #5
	blo _0800571C
	subs r0, #7
	cmp r1, r0
	beq _0800572C
	adds r0, #1
	cmp r1, r0
	beq _08005734
	b _08005738
	.align 2, 0
_080056F0: .4byte 0x00000807
_080056F4:
	cmp r1, #1
	beq _08005704
	cmp r1, #1
	bhi _0800570C
	ldr r0, _08005700 @ =0x085B8DA4
	b _08005736
	.align 2, 0
_08005700: .4byte 0x085B8DA4
_08005704:
	ldr r0, _08005708 @ =0x085B8DBE
	b _08005736
	.align 2, 0
_08005708: .4byte 0x085B8DBE
_0800570C:
	ldr r0, _08005710 @ =0x085B8DD8
	b _08005736
	.align 2, 0
_08005710: .4byte 0x085B8DD8
_08005714:
	ldr r0, _08005718 @ =0x085B8DFE
	b _08005736
	.align 2, 0
_08005718: .4byte 0x085B8DFE
_0800571C:
	ldr r0, _08005720 @ =0x085B8E24
	b _08005736
	.align 2, 0
_08005720: .4byte 0x085B8E24
_08005724:
	ldr r0, _08005728 @ =0x085B8E56
	b _08005736
	.align 2, 0
_08005728: .4byte 0x085B8E56
_0800572C:
	ldr r0, _08005730 @ =0x085B8E88
	b _08005736
	.align 2, 0
_08005730: .4byte 0x085B8E88
_08005734:
	ldr r0, _08005750 @ =0x085B8EBA
_08005736:
	str r0, [r3, #0x38]
_08005738:
	ldr r1, [r3, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0x80
	beq _08005762
	cmp r1, #0x80
	bhi _08005754
	cmp r1, #0x40
	beq _0800575E
	b _0800576E
	.align 2, 0
_08005750: .4byte 0x085B8EBA
_08005754:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _08005768
	b _0800576E
_0800575E:
	movs r4, #0
	b _08005772
_08005762:
	movs r4, #0x80
	lsls r4, r4, #3
	b _08005772
_08005768:
	movs r4, #0xc0
	lsls r4, r4, #4
	b _08005772
_0800576E:
	movs r4, #0x80
	lsls r4, r4, #4
_08005772:
	ldr r1, _08005798 @ =0x0202A688
	adds r0, r3, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r4
	strh r1, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005798: .4byte 0x0202A688

