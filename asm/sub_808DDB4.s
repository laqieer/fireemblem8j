	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8004504, 0x08004504 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_808C834, 0x0808C834 + 1
	.section .text.sub_808DDB4, "ax", %progbits
@ ClearBoxDialogueText @ JP 0x0808DDB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearBoxDialogueText
	.thumb_func
ClearBoxDialogueText:
	push {r4, lr}
	ldr r4, _0808DE0C @ =0x0203E7E4
	adds r0, r4, #0
	bl SetTextFont
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808DE10
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x28
	bl sub_8004504
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808DE2E
	bl sub_808C834
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808DE2E
	adds r0, r4, #0
	adds r0, #0x30
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x38
	bl sub_8004504
	b _0808DE2E
	.align 2, 0
_0808DE0C: .4byte 0x0203E7E4
_0808DE10:
	movs r4, #0
	b _0808DE22
_0808DE14:
	lsls r0, r4, #3
	ldr r1, _0808DE48 @ =0x0203E7FC
	adds r0, r0, r1
	movs r1, #0
	bl sub_80045BC
	adds r4, #1
_0808DE22:
	bl sub_808C834
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808DE14
_0808DE2E:
	ldr r0, _0808DE4C @ =0x08A73818
	bl Proc_EndEach
	ldr r0, _0808DE50 @ =0x08A738B8
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DE48: .4byte 0x0203E7FC
_0808DE4C: .4byte 0x08A73818
_0808DE50: .4byte 0x08A738B8

