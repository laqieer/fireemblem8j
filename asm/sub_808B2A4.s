	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_808C428, 0x0808C428 + 1
	.section .text.sub_808B2A4, "ax", %progbits
@ sub_808B2A4 @ JP 0x0808B2A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B2A4
	.thumb_func
sub_808B2A4:
	push {r4, lr}
	ldr r0, _0808B2C4 @ =0x08A72B50
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808B2BE
	bl sub_808C428
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_0808B2BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2C4: .4byte 0x08A72B50

