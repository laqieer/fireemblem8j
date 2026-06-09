	.syntax unified
	.set sub_808618C, 0x0808618C + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_808685C, "ax", %progbits
@ sub_808685C @ JP 0x0808685C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808685C
	.thumb_func
sub_808685C:
	push {lr}
	bl sub_80C1E74
	cmp r0, #2
	beq _0808686C
	movs r0, #6
	bl sub_808618C
_0808686C:
	pop {r0}
	bx r0

