	.syntax unified
	.set sub_808B128, 0x0808B128 + 1
	.section .text.StartItemHelpBox, "ax", %progbits
@ StartItemHelpBox @ JP 0x0808B0EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartItemHelpBox
	.thumb_func
StartItemHelpBox:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B11C @ =0x0203E764
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldr r1, _0808B120 @ =sub_808B5AC
	str r1, [r0, #0x18]
	ldr r1, _0808B124 @ =0x0203E784
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl sub_808B128
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B11C: .4byte 0x0203E764
_0808B120: .4byte 0x0808B5AD  @ sub_808B5AC
_0808B124: .4byte 0x0203E784

