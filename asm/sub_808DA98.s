	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_808DA98, "ax", %progbits
@ sub_808DA98 @ JP 0x0808DA98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DA98
	.thumb_func
sub_808DA98:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DAC0 @ =0x08A738D0
	bl Proc_Find
	cmp r0, #0
	beq _0808DABA
	ldr r0, _0808DAC4 @ =0x08A73798
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0808DABA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DAC0: .4byte 0x08A738D0
_0808DAC4: .4byte 0x08A73798

