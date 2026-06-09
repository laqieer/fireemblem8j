	.syntax unified
	.set NewEfxSpellCast, 0x08055C78 + 1
	.set SpellFx_Begin, 0x08056108 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.sub_8062D48, "ax", %progbits
@ sub_8062D48 @ JP 0x08062D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062D48
	.thumb_func
sub_8062D48:
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl sub_8056120
	ldr r0, _08062D74 @ =0x08600C64
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062D74: .4byte 0x08600C64

