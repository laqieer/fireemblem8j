	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_808C80C, "ax", %progbits
@ sub_808C80C @ JP 0x0808C80C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C80C
	.thumb_func
sub_808C80C:
	push {lr}
	ldr r0, _0808C81C @ =0x08A73798
	bl Proc_Find
	cmp r0, #0
	bne _0808C820
	movs r0, #0
	b _0808C822
	.align 2, 0
_0808C81C: .4byte 0x08A73798
_0808C820:
	movs r0, #1
_0808C822:
	pop {r1}
	bx r1
	.align 2, 0

