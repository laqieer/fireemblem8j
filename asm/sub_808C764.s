	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_808C764, "ax", %progbits
@ sub_808C764 @ JP 0x0808C764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C764
	.thumb_func
sub_808C764:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808C774 @ =0x0000FFFE
	cmp r4, r0
	bne _0808C778
	movs r0, #3
	b _0808C7AE
	.align 2, 0
_0808C774: .4byte 0x0000FFFE
_0808C778:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808C7A8
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808C79A
	movs r0, #1
	b _0808C7AE
_0808C79A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _0808C7AC
_0808C7A8:
	movs r0, #0
	b _0808C7AE
_0808C7AC:
	movs r0, #2
_0808C7AE:
	pop {r4}
	pop {r1}
	bx r1

