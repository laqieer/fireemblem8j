	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetWorldMapHblank, 0x080C6ABC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80B2BE4, 0x080B2BE4 + 1
	.set sub_80BDCDC, 0x080BDCDC + 1
	.section .text.sub_80BDD28, "ax", %progbits
@ sub_80BDD28 @ JP 0x080BDD28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDD28
	.thumb_func
sub_80BDD28:
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	strh r5, [r0, #0x3a]
	bl SetDefaultColorEffects
	ldr r0, _080BDE3C @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDE40 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDE44 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDE48 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r4, _080BDE4C @ =0x085C7290
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x40
	bl sub_8000D68
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BDE50 @ =0x08B269BC
	ldr r4, _080BDE54 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _080BDE58 @ =0x06015300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #2
	bl sub_80130D8
	bl sub_80BDCDC
	ldr r0, _080BDE5C @ =0x08B1D238
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BDE60 @ =0x08B1D16C
	ldr r1, _080BDE64 @ =0x06005000
	bl sub_8013008
	bl sub_804F8F4
	bl ResetText
	bl ResetTextFont
	ldr r4, _080BDE68 @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #0x36
	adds r0, r0, r4
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #1
	orrs r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	adds r3, r4, #0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r3]
	adds r3, #1
	ldrb r0, [r3]
	orrs r0, r2
	strb r0, [r3]
	orrs r1, r2
	mov r0, ip
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80B2BE4
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	bl SetWorldMapHblank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE3C: .4byte 0x02022CA8
_080BDE40: .4byte 0x020234A8
_080BDE44: .4byte 0x02023CA8
_080BDE48: .4byte 0x020244A8
_080BDE4C: .4byte 0x085C7290
_080BDE50: .4byte 0x08B269BC
_080BDE54: .4byte 0x02020188
_080BDE58: .4byte 0x06015300
_080BDE5C: .4byte 0x08B1D238
_080BDE60: .4byte 0x08B1D16C
_080BDE64: .4byte 0x06005000
_080BDE68: .4byte 0x03003020

