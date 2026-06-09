	.syntax unified
	.set GetItemDescId, 0x080172C0 + 1
	.set sub_808B55C, 0x0808B55C + 1
	.section .text.sub_808B5AC, "ax", %progbits
@ sub_808B5AC @ JP 0x0808B5AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B5AC
	.thumb_func
sub_808B5AC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl sub_808B55C
	cmp r0, #3
	bne _0808B5CC
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _0808B5D6
_0808B5CC:
	adds r0, r5, #0
	bl GetItemDescId
	adds r1, r4, #0
	adds r1, #0x4c
_0808B5D6:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

