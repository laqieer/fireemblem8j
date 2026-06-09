	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808DB54, "ax", %progbits
@ sub_808DB54 @ JP 0x0808DB54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DB54
	.thumb_func
sub_808DB54:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DB7C @ =0x08A73798
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_8002DE4
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB7C: .4byte 0x08A73798

