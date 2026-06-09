	.syntax unified
	.set NewEfxSpellCast, 0x08055C78 + 1
	.set SpellFx_Begin, 0x08056108 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_805AF28, 0x0805AF28 + 1
	.set sub_805B0B4, 0x0805B0B4 + 1
	.section .text.sub_805E488, "ax", %progbits
@ sub_805E488 @ JP 0x0805E488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E488
	.thumb_func
sub_805E488:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl sub_8056120
	ldr r0, _0805E4C0 @ =0x085FF5F0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_805B0B4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_805AF28
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E4C0: .4byte 0x085FF5F0

