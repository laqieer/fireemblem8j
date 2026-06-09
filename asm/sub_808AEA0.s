	.syntax unified
	.set GetUnitTotalSupportLevel, 0x080281F8 + 1
	.set sub_808B5E0, 0x0808B5E0 + 1
	.set sub_808B610, 0x0808B610 + 1
	.section .text.sub_808AEA0, "ax", %progbits
@ sub_808AEA0 @ JP 0x0808AEA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AEA0
	.thumb_func
sub_808AEA0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808AEC4 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _0808AECE
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _0808AEC8
	adds r0, r4, #0
	bl sub_808B610
	b _0808AECE
	.align 2, 0
_0808AEC4: .4byte 0x02003BFC
_0808AEC8:
	adds r0, r4, #0
	bl sub_808B5E0
_0808AECE:
	pop {r4}
	pop {r0}
	bx r0

