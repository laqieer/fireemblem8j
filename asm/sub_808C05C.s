	.syntax unified
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8016A68, 0x08016A68 + 1
	.set sub_8016B3C, 0x08016B3C + 1
	.section .text.sub_808C05C, "ax", %progbits
@ sub_808C05C @ JP 0x0808C05C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C05C
	.thumb_func
sub_808C05C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808C0B4 @ =0x0203E7A8
	movs r0, #0x93
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_8016B3C
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #7
	bl sub_80043B8
	ldr r0, _0808C0B8 @ =0x0000048F
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #8
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_8016A68
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #7
	bl sub_80043B8
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C0B4: .4byte 0x0203E7A8
_0808C0B8: .4byte 0x0000048F

