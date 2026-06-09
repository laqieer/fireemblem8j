	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_808B824, "ax", %progbits
@ sub_808B824 @ JP 0x0808B824 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B824
	.thumb_func
sub_808B824:
	push {lr}
	adds r2, r0, #0
	movs r0, #1
	ands r0, r2
	ldr r3, _0808B84C @ =0x08A79D10
	cmp r0, #0
	beq _0808B834
	ldr r3, _0808B850 @ =0x08A79B90
_0808B834:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0808B87A
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0808B854
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r3, r0
	b _0808B87A
	.align 2, 0
_0808B84C: .4byte 0x08A79D10
_0808B850: .4byte 0x08A79B90
_0808B854:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0808B87A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0808B866
	adds r3, #0x40
_0808B866:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808B870
	adds r3, #0x80
_0808B870:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0808B87A
	adds r3, #0x80
_0808B87A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0808B884
	adds r3, #0x20
_0808B884:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0

