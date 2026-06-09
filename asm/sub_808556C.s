	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_808556C, "ax", %progbits
@ sub_808556C @ JP 0x0808556C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808556C
	.thumb_func
sub_808556C:
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8086350
	cmp r0, #0x15
	beq _08085582
	movs r0, #0
	b _08085584
_08085582:
	movs r0, #1
_08085584:
	pop {r1}
	bx r1

