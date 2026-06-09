	.syntax unified
	.set GetCursorScreenSideX, 0x0808E614 + 1
	.set GetCursorScreenSideXAlt, 0x0808E63C + 1
	.set IsCursorInLowerScreenHalf, 0x0808F48C + 1
	.section .text.sub_808F4B0, "ax", %progbits
@ sub_808F4B0 @ JP 0x0808F4B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F4B0
	.thumb_func
sub_808F4B0:
	push {lr}
	bl IsCursorInLowerScreenHalf
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F4D8
	bl GetCursorScreenSideX
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0808F4CC
	movs r0, #2
	b _0808F4F6
_0808F4CC:
	bl GetCursorScreenSideX
	cmp r0, #1
	bne _0808F4F4
	movs r0, #1
	b _0808F4F6
_0808F4D8:
	bl GetCursorScreenSideXAlt
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0808F4E8
	movs r0, #4
	b _0808F4F6
_0808F4E8:
	bl GetCursorScreenSideXAlt
	cmp r0, #1
	bne _0808F4F4
	movs r0, #3
	b _0808F4F6
_0808F4F4:
	movs r0, #0
_0808F4F6:
	pop {r1}
	bx r1
	.align 2, 0

