	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808CB8C, "ax", %progbits
@ sub_808CB8C @ JP 0x0808CB8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CB8C
	.thumb_func
sub_808CB8C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808C834
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _0808CBB2
	ldr r0, _0808CBB8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0808CBB2
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0808CBB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CBB8: .4byte 0x085775CC

