	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set StartHelpBoxAtPos, 0x0808C4F0 + 1
	.set sub_804F5F8, 0x0804F5F8 + 1
	.set sub_804F604, 0x0804F604 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_808C7D4, "ax", %progbits
@ sub_808C7D4 @ JP 0x0808C7D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C7D4
	.thumb_func
sub_808C7D4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	bl sub_804F5F8
	adds r4, r0, #0
	bl sub_804F604
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBoxAtPos
	ldr r0, _0808C808 @ =0x08A73780
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808C808: .4byte 0x08A73780

