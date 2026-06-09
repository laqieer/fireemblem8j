	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.section .text.sub_80C3E34, "ax", %progbits
@ sub_80C3E34 @ JP 0x080C3E34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3E34
	.thumb_func
sub_80C3E34:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080C3F04 @ =0x03003020
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
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	ldr r0, _080C3F08 @ =0x08B1E894
	ldr r4, _080C3F0C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _080C3F10 @ =0x06004660
	adds r0, r4, #0
	movs r2, #0xd
	movs r3, #2
	bl sub_80130D8
	ldr r0, _080C3F14 @ =0x08B1E998
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080C3F18 @ =0x08B1CD14
	ldr r1, _080C3F1C @ =0x06004620
	bl sub_8013008
	ldr r0, _080C3F20 @ =0x08B1CCF4
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	bl ResetTextFont
	ldr r0, _080C3F24 @ =0x08AC1E24
	ldr r1, [r5, #0x14]
	bl sub_8002BCC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3F04: .4byte 0x03003020
_080C3F08: .4byte 0x08B1E894
_080C3F0C: .4byte 0x02020188
_080C3F10: .4byte 0x06004660
_080C3F14: .4byte 0x08B1E998
_080C3F18: .4byte 0x08B1CD14
_080C3F1C: .4byte 0x06004620
_080C3F20: .4byte 0x08B1CCF4
_080C3F24: .4byte 0x08AC1E24

