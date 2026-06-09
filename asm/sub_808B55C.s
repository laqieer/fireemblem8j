	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_808B55C, "ax", %progbits
@ sub_808B55C @ JP 0x0808B55C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B55C
	.thumb_func
sub_808B55C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B56C @ =0x0000FFFE
	cmp r4, r0
	bne _0808B570
	movs r0, #3
	b _0808B5A6
	.align 2, 0
_0808B56C: .4byte 0x0000FFFE
_0808B570:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808B5A0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808B592
	movs r0, #1
	b _0808B5A6
_0808B592:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _0808B5A4
_0808B5A0:
	movs r0, #0
	b _0808B5A6
_0808B5A4:
	movs r0, #2
_0808B5A6:
	pop {r4}
	pop {r1}
	bx r1

