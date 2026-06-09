	.syntax unified
	.set CheckTutorialEvent, 0x0808615C + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_808682C, "ax", %progbits
@ sub_808682C @ JP 0x0808682C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808682C
	.thumb_func
sub_808682C:
	push {lr}
	bl sub_80C1E74
	cmp r0, #2
	beq _08086842
	movs r0, #5
	bl CheckTutorialEvent
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08086844
_08086842:
	movs r0, #0
_08086844:
	pop {r1}
	bx r1

