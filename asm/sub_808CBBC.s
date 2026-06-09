	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808C834, 0x0808C834 + 1
	.set sub_808CD00, 0x0808CD00 + 1
	.section .text.sub_808CBBC, "ax", %progbits
@ sub_808CBBC @ JP 0x0808CBBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CBBC
	.thumb_func
sub_808CBBC:
	push {lr}
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808CBDC
	ldr r0, _0808CBEC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808CBDC
	ldr r0, _0808CBF0 @ =0x000002E7
	bl m4aSongNumStart
_0808CBDC:
	movs r0, #0
	bl SetTextFontGlyphs
	bl sub_808CD00
	pop {r0}
	bx r0
	.align 2, 0
_0808CBEC: .4byte 0x0202BCEC
_0808CBF0: .4byte 0x000002E7

