	.syntax unified
	.set Proc_GotoScript, 0x08002EAC + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set sub_804F5F8, 0x0804F5F8 + 1
	.set sub_804F604, 0x0804F604 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80502F4, "ax", %progbits
@ sub_80502F4 @ JP 0x080502F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80502F4
	.thumb_func
sub_80502F4:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _08050324 @ =0x085E0710
	bl Proc_GotoScript
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
	bl StartHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08050324: .4byte 0x085E0710

