	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B640, "ax", %progbits
@ sub_808B640 @ JP 0x0808B640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B640
	.thumb_func
sub_808B640:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0808B650
	movs r0, #0
	b _0808B66A
_0808B650:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808B668
	adds r0, r2, #0
	bl sub_80D65C0
_0808B668:
	movs r0, #1
_0808B66A:
	pop {r1}
	bx r1
	.align 2, 0

