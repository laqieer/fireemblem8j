	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802F584, 0x0802F584 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1DBC, 0x080B1DBC + 1
	.set sub_80B2730, 0x080B2730 + 1
	.section .text.sub_809EE4C, "ax", %progbits
@ sub_809EE4C @ JP 0x0809EE4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EE4C
	.thumb_func
sub_809EE4C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8097D18
	bl ResetText
	movs r0, #0
	bl sub_8001ACC
	bl sub_80048D8
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl ResetFaces
	bl sub_808B7E0
	ldr r2, _0809EEDC @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	bl sub_80B2730
	bl sub_80B1DBC
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80B1524
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r1, #1
	movs r3, #0
	bl sub_802F584
	ldr r1, _0809EEE0 @ =0x0203A4D0
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl sub_802C94C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EEDC: .4byte 0x03003020
_0809EEE0: .4byte 0x0203A4D0

