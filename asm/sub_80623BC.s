	.syntax unified
	.set NewEfxSpellCast, 0x08055C78 + 1
	.set SpellFx_Begin, 0x08056108 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.sub_80623BC, "ax", %progbits
@ sub_80623BC @ JP 0x080623BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80623BC
	.thumb_func
sub_80623BC:
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl sub_8056120
	ldr r0, _080623E0 @ =0x08600B84
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080623E0: .4byte 0x08600B84

