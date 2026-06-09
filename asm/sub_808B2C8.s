	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_808C428, 0x0808C428 + 1
	.section .text.sub_808B2C8, "ax", %progbits
@ sub_808B2C8 @ JP 0x0808B2C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B2C8
	.thumb_func
sub_808B2C8:
	push {r4, lr}
	ldr r0, _0808B2E8 @ =0x08A72B50
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808B2E0
	bl sub_808C428
	adds r0, r4, #0
	bl Proc_End
_0808B2E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E8: .4byte 0x08A72B50

