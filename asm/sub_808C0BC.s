	.syntax unified
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_808C0BC, "ax", %progbits
@ sub_808C0BC @ JP 0x0808C0BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C0BC
	.thumb_func
sub_808C0BC:
	push {r4, lr}
	ldr r4, _0808C0EC @ =0x0203E7A8
	ldr r0, _0808C0F0 @ =0x00000821
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_80043B8
	ldr r0, _0808C0F4 @ =0x00000822
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x5a
	movs r2, #8
	bl sub_80043B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808C0EC: .4byte 0x0203E7A8
_0808C0F0: .4byte 0x00000821
_0808C0F4: .4byte 0x00000822

