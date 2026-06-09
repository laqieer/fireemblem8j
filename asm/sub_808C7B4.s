	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808C7B4, "ax", %progbits
@ sub_808C7B4 @ JP 0x0808C7B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C7B4
	.thumb_func
sub_808C7B4:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808C7D0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808C7CC
	adds r0, r2, #0
	bl sub_8002DE4
_0808C7CC:
	pop {r0}
	bx r0
	.align 2, 0
_0808C7D0: .4byte 0x085775CC

