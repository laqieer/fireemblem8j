	.syntax unified
	.set sub_80096B0, 0x080096B0 + 1
	.section .text.sub_808112C, "ax", %progbits
@ sub_808112C @ JP 0x0808112C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808112C
	.thumb_func
sub_808112C:
	push {lr}
	bl sub_80096B0
	pop {r0}
	bx r0
	.align 2, 0

