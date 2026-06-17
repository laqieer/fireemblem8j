	.syntax unified
	.set SpellFx_Begin, 0x08056108 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.StartSpellAnimDummy, "ax", %progbits
@ StartSpellAnimDummy @ JP 0x0805CC2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartSpellAnimDummy
	.thumb_func
StartSpellAnimDummy:
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl sub_8056120
	ldr r0, _0805CC4C @ =0x085FF2A0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CC4C: .4byte 0x085FF2A0

