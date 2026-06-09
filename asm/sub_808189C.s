	.syntax unified
	.set sub_8010F98, 0x08010F98 + 1
	.section .text.sub_808189C, "ax", %progbits
@ sub_808189C @ JP 0x0808189C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808189C
	.thumb_func
sub_808189C:
	push {lr}
	bl sub_8010F98
	pop {r0}
	bx r0
	.align 2, 0

