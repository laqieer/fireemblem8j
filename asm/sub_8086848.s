	.syntax unified
	.set sub_808618C, 0x0808618C + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8086848, "ax", %progbits
@ sub_8086848 @ JP 0x08086848 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086848
	.thumb_func
sub_8086848:
	push {lr}
	bl sub_80C1E74
	cmp r0, #2
	beq _08086858
	movs r0, #5
	bl sub_808618C
_08086858:
	pop {r0}
	bx r0

