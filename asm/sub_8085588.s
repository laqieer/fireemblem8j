	.syntax unified
	.set CheckWin, 0x08085610 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8085588, "ax", %progbits
@ sub_8085588 @ JP 0x08085588 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085588
	.thumb_func
sub_8085588:
	push {lr}
	bl sub_80C1E74
	cmp r0, #2
	beq _0808559C
	bl CheckWin
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808559E
_0808559C:
	movs r0, #0
_0808559E:
	pop {r1}
	bx r1
	.align 2, 0

