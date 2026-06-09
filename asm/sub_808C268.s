	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B55C, 0x0808B55C + 1
	.set sub_808BF4C, 0x0808BF4C + 1
	.set sub_808C05C, 0x0808C05C + 1
	.set sub_808C0BC, 0x0808C0BC + 1
	.section .text.sub_808C268, "ax", %progbits
@ sub_808C268 @ JP 0x0808C268 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C268
	.thumb_func
sub_808C268:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _0808C290 @ =0x0203E790
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl sub_808B55C
	adds r1, r0, #0
	cmp r1, #1
	beq _0808C2A6
	cmp r1, #1
	bgt _0808C294
	cmp r1, #0
	beq _0808C29E
	b _0808C2C8
	.align 2, 0
_0808C290: .4byte 0x0203E790
_0808C294:
	cmp r1, #2
	beq _0808C2B4
	cmp r1, #3
	beq _0808C2BC
	b _0808C2C8
_0808C29E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _0808C2C8
_0808C2A6:
	adds r0, r4, #0
	bl sub_808BF4C
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _0808C2C6
_0808C2B4:
	adds r0, r4, #0
	bl sub_808C05C
	b _0808C2C0
_0808C2BC:
	bl sub_808C0BC
_0808C2C0:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_0808C2C6:
	strh r0, [r1]
_0808C2C8:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

