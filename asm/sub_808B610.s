	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B610, "ax", %progbits
@ sub_808B610 @ JP 0x0808B610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B610
	.thumb_func
sub_808B610:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0808B620
	movs r0, #0
	b _0808B63A
_0808B620:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x80
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808B638
	adds r0, r2, #0
	bl sub_80D65C0
_0808B638:
	movs r0, #1
_0808B63A:
	pop {r1}
	bx r1
	.align 2, 0

