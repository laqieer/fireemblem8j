	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8004504, 0x08004504 + 1
	.section .text.sub_808C428, "ax", %progbits
@ sub_808C428 @ JP 0x0808C428 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C428
	.thumb_func
sub_808C428:
	push {r4, lr}
	ldr r4, _0808C464 @ =0x0203E790
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_8004504
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_8004504
	adds r4, #0x28
	adds r0, r4, #0
	bl sub_8004504
	ldr r0, _0808C468 @ =0x08A736E0
	bl Proc_EndEach
	ldr r0, _0808C46C @ =0x08A73708
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808C464: .4byte 0x0203E790
_0808C468: .4byte 0x08A736E0
_0808C46C: .4byte 0x08A73708

