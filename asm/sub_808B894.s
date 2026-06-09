	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_808B894, "ax", %progbits
@ sub_808B894 @ JP 0x0808B894 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B894
	.thumb_func
sub_808B894:
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r0, #0x84
	lsls r0, r0, #1
	cmp r3, r0
	bls _0808B8A4
	movs r3, #0x54
_0808B8A4:
	ldr r2, _0808B8D0 @ =0x0203E788
	ldr r0, _0808B8D4 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #2]
	ldr r1, _0808B8D8 @ =0x08A732C0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B8D0: .4byte 0x0203E788
_0808B8D4: .4byte 0x000003FF
_0808B8D8: .4byte 0x08A732C0

