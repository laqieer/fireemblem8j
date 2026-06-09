	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B55C, 0x0808B55C + 1
	.set sub_808BFE0, 0x0808BFE0 + 1
	.set sub_808C0F8, 0x0808C0F8 + 1
	.section .text.sub_808C2DC, "ax", %progbits
@ sub_808C2DC @ JP 0x0808C2DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C2DC
	.thumb_func
sub_808C2DC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _0808C2F8 @ =0x0203E790
	bl SetTextFont
	adds r0, r4, #0
	bl sub_808B55C
	cmp r0, #1
	beq _0808C2FC
	cmp r0, #3
	beq _0808C304
	b _0808C308
	.align 2, 0
_0808C2F8: .4byte 0x0203E790
_0808C2FC:
	adds r0, r4, #0
	bl sub_808BFE0
	b _0808C308
_0808C304:
	bl sub_808C0F8
_0808C308:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

