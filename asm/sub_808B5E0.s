	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B5E0, "ax", %progbits
@ sub_808B5E0 @ JP 0x0808B5E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B5E0
	.thumb_func
sub_808B5E0:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _0808B5F0
	movs r0, #0
	b _0808B60A
_0808B5F0:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808B608
	adds r0, r2, #0
	bl sub_80D65C0
_0808B608:
	movs r0, #1
_0808B60A:
	pop {r1}
	bx r1
	.align 2, 0

