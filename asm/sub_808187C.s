	.syntax unified
	.set sub_80096B0, 0x080096B0 + 1
	.section .text.sub_808187C, "ax", %progbits
@ sub_808187C @ JP 0x0808187C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808187C
	.thumb_func
sub_808187C:
	push {lr}
	bl sub_80096B0
	pop {r0}
	bx r0
	.align 2, 0

