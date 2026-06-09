	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808AED4, 0x0808AED4 + 1
	.section .text.sub_808B044, "ax", %progbits
@ sub_808B044 @ JP 0x0808B044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B044
	.thumb_func
sub_808B044:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_808AED4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808B064
	adds r0, r4, #0
	bl sub_8002DE4
_0808B064:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

