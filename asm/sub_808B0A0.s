	.syntax unified
	.set sub_804F5F8, 0x0804F5F8 + 1
	.set sub_804F604, 0x0804F604 + 1
	.set sub_808B128, 0x0808B128 + 1
	.section .text.sub_808B0A0, "ax", %progbits
@ sub_808B0A0 @ JP 0x0808B0A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B0A0
	.thumb_func
sub_808B0A0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bge _0808B0BC
	cmp r3, #0
	bge _0808B0BC
	bl sub_804F5F8
	adds r4, r0, #0
	bl sub_804F604
	adds r3, r0, #0
_0808B0BC:
	ldr r0, _0808B0E4 @ =0x0203E764
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r3, [r0, #0x11]
	strh r5, [r0, #0x12]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r2, _0808B0E8 @ =0x0203E784
	strh r1, [r2]
	strh r1, [r2, #2]
	movs r1, #1
	bl sub_808B128
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B0E4: .4byte 0x0203E764
_0808B0E8: .4byte 0x0203E784

