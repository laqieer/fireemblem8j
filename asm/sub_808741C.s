	.syntax unified
	.set sub_8028738, 0x08028738 + 1
	.section .text.sub_808741C, "ax", %progbits
@ sub_808741C @ JP 0x0808741C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808741C
	.thumb_func
sub_808741C:
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_8028738
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

