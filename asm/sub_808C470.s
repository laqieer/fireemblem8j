	.syntax unified
	.set sub_808AED4, 0x0808AED4 + 1
	.section .text.sub_808C470, "ax", %progbits
@ sub_808C470 @ JP 0x0808C470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C470
	.thumb_func
sub_808C470:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_808AED4
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _0808C492
	adds r0, r3, #1
	strh r0, [r2]
_0808C492:
	pop {r4, r5}
	pop {r0}
	bx r0

