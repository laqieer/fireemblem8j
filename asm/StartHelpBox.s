	.syntax unified
	.set sub_808B128, 0x0808B128 + 1
	.section .text.StartHelpBox, "ax", %progbits
@ StartHelpBox @ JP 0x0808B06C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartHelpBox
	.thumb_func
StartHelpBox:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B098 @ =0x0203E764
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	ldr r1, _0808B09C @ =0x0203E784
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl sub_808B128
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B098: .4byte 0x0203E764
_0808B09C: .4byte 0x0203E784

